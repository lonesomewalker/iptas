#!/bin/bash

# aktuell bekannte AS:
# AS36066
# AS32392
# AS29873
# AS2723
# AS14741

iptables -N AS_ENDURANCE_DENY;

iptables -I INPUT -j AS_ENDURANCE_DENY;

asarray=("36066" "32392" "29873" "2723" "14741")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> endu

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < endu | sort | aggregate | xargs -n1 -I% iptables -A AS_ENDURANCE_DENY -s % -j DROP

rm endu

exit 0