#!/bin/bash

# AS von ForestNet LLC

iptables -N AS_FORESTNET_DENY;

iptables -I INPUT -j AS_FORESTNET_DENY;

asarray=("62088" "211741")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> forestnet

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < forestnet | sort | aggregate | xargs -n1 -I% iptables -A AS_FORESTNET_DENY -s % -j DROP

rm forestnet

exit 0