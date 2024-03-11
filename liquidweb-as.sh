#!/bin/bash

iptables -N AS_LIQUIDWEB_DENY;

iptables -I INPUT -j AS_LIQUIDWEB_DENY;

asarray=("32244")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> liquidweb

done


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < liquidweb | sort | aggregate | xargs -n1 -I% iptables -A AS_LIQUIDWEB_DENY -s % -j DROP

rm liquidweb

exit 0