#!/bin/bash

# AS von Corporate Colocation
# AS17139


iptables -N AS_CORPCOLO_DENY;

iptables -I INPUT -j AS_CORPCOLO_DENY;

asarray=("17139")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> corpcolo

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < corpcolo | sort | aggregate | xargs -n1 -I% iptables -A AS_CORPCOLO_DENY -s % -j DROP

rm corpcolo

exit 0
