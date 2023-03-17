#!/bin/bash

# AS von Limited Liability Company "lifecell"


iptables -N AS_LIFECELL_DENY;

iptables -I INPUT -j AS_LIFECELL_DENY;

asarray=("34058")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> lifecell

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < lifecell | sort | aggregate | xargs -n1 -I% iptables -A AS_LIFECELL_DENY -s % -j DROP

rm lifecell

exit 0