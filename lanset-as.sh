#!/bin/bash

# AS von LANSET
# AS16578


iptables -N AS_LANSET_DENY;

iptables -I INPUT -j AS_LANSET_DENY;

asarray=("16578")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> lanset

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < lanset | sort | aggregate | xargs -n1 -I% iptables -A AS_LANSET_DENY -s % -j DROP

rm lanset

exit 0