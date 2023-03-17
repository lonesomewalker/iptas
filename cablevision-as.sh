#!/bin/bash

# AS von cablevision
# AS10481

iptables -N AS_CABLEVISION_DENY;

iptables -I INPUT -j AS_CABLEVISION_DENY;

asarray=("10481")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> cablevision

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < cablevision | sort | aggregate | xargs -n1 -I% iptables -A AS_CABLEVISION_DENY -s % -j DROP

rm cablevision

exit 0