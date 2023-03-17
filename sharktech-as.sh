#!/bin/bash

# aktuell bekannte AS:
# AS46844

iptables -N AS_SHARK_DENY;

iptables -I INPUT -j AS_SHARK_DENY;

curl -s 'https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=46844' | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> shark

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < shark | sort | aggregate | xargs -n1 -I% iptables -A AS_SHARK_DENY -s % -j DROP

rm shark

exit 0