#!/bin/bash

# aktuell bekannte AS:
# AS199264

iptables -N AS_CLOUDSTAR_DENY;

iptables -I INPUT -j AS_CLOUDSTAR_DENY;

asarray=("209299")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> cloudstar

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < cloudstar | sort | aggregate | xargs -n1 -I% iptables -A AS_CLOUDSTAR_DENY -s % -j DROP

rm cloudstar

exit 0