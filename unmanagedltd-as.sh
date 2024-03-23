#!/bin/bash

iptables -N AS_UNMANAGEDLTD_DENY;

iptables -I INPUT -j AS_UNMANAGEDLTD_DENY;

asarray=("47890")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> unmanagedltd

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < unmanagedltd | sort | aggregate | xargs -n1 -I% iptables -A AS_UNMANAGEDLTD_DENY -s % -j DROP

rm unmanagedltd

exit 0