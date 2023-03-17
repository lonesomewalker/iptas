#!/bin/bash

# AS von nexeon technologies inc.
# AS20278
# AS131199

iptables -N AS_NEXEON_DENY;

iptables -I INPUT -j AS_NEXEON_DENY;

asarray=("20278" "131199")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> nexeon

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < nexeon | sort | aggregate | xargs -n1 -I% iptables -A AS_NEXEON_DENY -s % -j DROP

rm nexeon

exit 0