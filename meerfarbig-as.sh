#!/bin/bash

# aktuell bekannte AS:
# AS34549

iptables -N AS_MEER_DENY;

iptables -I INPUT -j AS_MEER_DENY;

asarray=("34549")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> meer

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < meer | sort | aggregate | xargs -n1 -I% iptables -A AS_MEER_DENY -s % -j DROP

rm meer

exit 0