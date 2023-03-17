#!/bin/bash

# aktuell bekannte AS:
# AS237

iptables -N AS_CENSYS_DENY;

iptables -I INPUT -j AS_CENSYS_DENY;

asarray=("237")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> censys

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < censys | sort | aggregate | xargs -n1 -I% iptables -A AS_CENSYS_DENY -s % -j DROP

rm censys

exit 0