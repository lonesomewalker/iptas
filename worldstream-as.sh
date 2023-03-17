#!/bin/bash

# AS49981


iptables -N AS_WLDSTRM_DENY;

iptables -I INPUT -j AS_WLDSTRM_DENY;

asarray=("49981")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> wldstrm

done


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < wldstrm | sort | aggregate | xargs -n1 -I% iptables -A AS_WLDSTRM_DENY -s % -j DROP

rm wldstrm

exit 0