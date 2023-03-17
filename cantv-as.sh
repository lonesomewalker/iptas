#!/bin/bash

# AS von CANTV
# AS8048
# AS263180
# AS262180
# AS10293


iptables -N AS_CANTV_DENY;

iptables -I INPUT -j AS_CANTV_DENY;

asarray=("8048" "263180" "262180" "10293")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> cantv

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < cantv | sort | aggregate | xargs -n1 -I% iptables -A AS_CANTV_DENY -s % -j DROP

rm cantv

exit 0