#!/bin/bash

# aktuell bekannte AS:
# AS12876
# AS29447


iptables -N AS_ONLSAS_DENY;

iptables -I INPUT -j AS_ONLSAS_DENY;

asarray=("12876" "29447")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> onlinesas

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < onlinesas | sort | aggregate | xargs -n1 -I% iptables -A AS_ONLSAS_DENY -s % -j DROP

rm onlinesas

exit 0