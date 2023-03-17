#!/bin/bash

# AS von Telia LV
# AS5518

iptables -N AS_TELIALV_DENY;

iptables -I INPUT -j AS_TELIALV_DENY;

asarray=("5518")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> telialv

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < telialv | sort | aggregate | xargs -n1 -I% iptables -A AS_TELIALV_DENY -s % -j DROP

rm telialv

exit 0