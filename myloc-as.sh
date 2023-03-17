#!/bin/bash

# AS von myloc IT
# AS24961

iptables -N AS_MYLOC_DENY;

iptables -I INPUT -j AS_MYLOC_DENY;


curl -s 'https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=24961' | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' > myloc


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < myloc | sort | aggregate | xargs -n1 -I% iptables -A AS_MYLOC_DENY -s % -j DROP

rm myloc

exit 0