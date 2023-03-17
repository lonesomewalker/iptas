#!/bin/bash

# AS von Psychz
# AS63993
# AS40676
# AS328153

iptables -N AS_PSYCHZ_DENY;

iptables -I INPUT -j AS_PSYCHZ_DENY;

asarray=("63993" "40676" "328153")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> psy

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < psy | sort | aggregate | xargs -n1 -I% iptables -A AS_PSYCHZ_DENY -s % -j DROP

rm psy

exit 0