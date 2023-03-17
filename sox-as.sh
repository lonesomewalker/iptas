#!/bin/bash

# aktuell bekannte AS:
# AS7506

iptables -N AS_SOX_DENY;

iptables -I INPUT -j AS_SOX_DENY;

curl -s 'https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=7506' | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> sox

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < sox | sort | aggregate | xargs -n1 -I% iptables -A AS_SOX_DENY -s % -j DROP

rm sox

exit 0