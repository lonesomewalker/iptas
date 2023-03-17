#!/bin/bash

# AS von Yahoo & Inktomi
# AS26101


iptables -N AS_YAHOO_DENY;

iptables -I INPUT -j AS_YAHOO_DENY;

asarray=("26101")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> yahoo

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < yahoo | sort | aggregate | xargs -n1 -I% iptables -A AS_YAHOO_DENY -s % -j DROP

rm yahoo

exit 0