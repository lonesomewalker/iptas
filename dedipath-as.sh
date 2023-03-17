#!/bin/bash

# aktuell bekannte AS:
# AS35913

iptables -N AS_DEDIPATH_DENY;

iptables -I INPUT -j AS_DEDIPATH_DENY;

asarray=("35913")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> dedipath

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < dedipath | sort | aggregate | xargs -n1 -I% iptables -A AS_DEDIPATH_DENY -s % -j DROP

rm dedipath

exit 0