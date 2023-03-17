#!/bin/bash

# aktuell bekannte AS:
# AS44029
# AS394189
# AS31034
# AS30548
# AS200185
# AS199653

iptables -N AS_ARUBA_DENY;

iptables -I INPUT -j AS_ARUBA_DENY;

asarray=("44029" "394189" "31034" "30548" "200185" "199653")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> aruba

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < aruba | sort | aggregate | xargs -n1 -I% iptables -A AS_ARUBA_DENY -s % -j DROP

rm aruba

exit 0