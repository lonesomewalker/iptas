#!/bin/bash

# AS von root SA
# AS5577
# AS44042

iptables -N AS_ROOTSA_DENY;

iptables -I INPUT -j AS_ROOTSA_DENY;

asarray=("5577" "44042")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> rootsa

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < rootsa | sort | aggregate | xargs -n1 -I% iptables -A AS_ROOTSA_DENY -s % -j DROP

rm rootsa

exit 0