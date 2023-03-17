#!/bin/bash

# AS von Novogara Ltd.
# AS204655

iptables -N AS_NOVOGARA_DENY;

iptables -I INPUT -j AS_NOVOGARA_DENY;


curl -s 'https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=204655' | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' > novo


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < novo | sort | aggregate | xargs -n1 -I% iptables -A AS_NOVOGARA_DENY -s % -j DROP

rm novo

exit 0