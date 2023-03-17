#!/bin/bash

# aktuell bekannte AS:
# AS9009

iptables -N AS_M247_DENY;

iptables -I INPUT -j AS_M247_DENY;

asarray=("9009")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> m247

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < m247 | sort | aggregate | xargs -n1 -I% iptables -A AS_M247_DENY -s % -j DROP

rm m247

exit 0