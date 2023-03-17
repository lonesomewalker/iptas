#!/bin/bash

# AS37153


iptables -N AS_COZAHETZ_DENY;

iptables -I INPUT -j AS_COZAHETZ_DENY;

asarray=("37153")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> cozahetz

done


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < cozahetz | sort | aggregate | xargs -n1 -I% iptables -A AS_COZAHETZ_DENY -s % -j DROP

rm cozahetz

exit 0