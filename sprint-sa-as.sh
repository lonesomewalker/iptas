#!/bin/bash

# AS von Sprint S.A.
# AS197226

iptables -N AS_SPRINTSA_DENY;

iptables -I INPUT -j AS_SPRINTSA_DENY;

asarray=("197226")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> sprintsa

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < sprintsa | sort | aggregate | xargs -n1 -I% iptables -A AS_SPRINTSA_DENY -s % -j DROP

rm sprintsa

exit 0