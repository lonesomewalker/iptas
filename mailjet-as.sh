#!/bin/bash

# aktuell bekannte AS:
# AS200069

iptables -N AS_MJ_DENY;

iptables -I INPUT -j AS_MJ_DENY;

asarray=("200069")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> mj

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < mj | sort | aggregate | xargs -n1 -I% iptables -A AS_MJ_DENY -s % -j DROP

rm mj

exit 0