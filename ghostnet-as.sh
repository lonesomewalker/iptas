#!/bin/bash

# aktuell bekannte AS:
# AS12586

iptables -N AS_GHOSTNET_DENY;

iptables -I INPUT -j AS_GHOSTNET_DENY;

asarray=("12586")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> ghost

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < ghost | sort | aggregate | xargs -n1 -I% iptables -A AS_GHOSTNET_DENY -s % -j DROP

rm ghost

exit 0