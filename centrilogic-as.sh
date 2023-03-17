#!/bin/bash

# aktuell bekannte AS:
# AS19693

iptables -N AS_CENTRILOGIG_DENY;

iptables -I INPUT -j AS_CENTRILOGIG_DENY;

asarray=("19693")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> centrilogic

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < centrilogic | sort | aggregate | xargs -n1 -I% iptables -A AS_CENTRILOGIG_DENY -s % -j DROP

rm centrilogic

exit 0