#!/bin/bash

# aktuell bekannte AS:
# AS15149

iptables -N AS_CORE_DENY;

iptables -I INPUT -j AS_CORE_DENY;

asarray=("15149")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> core

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < core | sort | aggregate | xargs -n1 -I% iptables -A AS_CORE_DENY -s % -j DROP

rm core

exit 0