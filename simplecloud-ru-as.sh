#!/bin/bash

iptables -N AS_SIMPLECLOUDRU_DENY;

iptables -I INPUT -j AS_SIMPLECLOUDRU_DENY;

asarray=("201848")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> simplecloudru

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < simplecloudru | sort | aggregate | xargs -n1 -I% iptables -A AS_SIMPLECLOUDRU_DENY -s % -j DROP

rm simplecloudru

exit 0