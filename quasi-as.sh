#!/bin/bash

# AS von Quasi Networks
# AS29073

iptables -N AS_QUASI_DENY;

iptables -I INPUT -j AS_QUASI_DENY;

asarray=("29073")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> quasi

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < quasi | sort | aggregate | xargs -n1 -I% iptables -A AS_QUASI_DENY -s % -j DROP

rm quasi

exit 0