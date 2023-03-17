#!/bin/bash

iptables -N AS_TENCENT_DENY;

iptables -I INPUT -j AS_TENCENT_DENY;

asarray=("58835" "45090" "137876" "133478" "132591" "132203")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> tencent

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < tencent | sort | aggregate | xargs -n1 -I% iptables -A AS_TENCENT_DENY -s % -j DROP

rm tencent

exit 0