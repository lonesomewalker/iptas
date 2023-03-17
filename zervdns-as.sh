#!/bin/bash

# AS von ZervDNS -> Tamatiya EOOD
# AS50360


iptables -N AS_ZERVDNS_DENY;

iptables -I INPUT -j AS_ZERVDNS_DENY;

asarray=("50360")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> zervdns

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < zervdns | sort | aggregate | xargs -n1 -I% iptables -A AS_ZERVDNS_DENY -s % -j DROP

rm zervdns

exit 0