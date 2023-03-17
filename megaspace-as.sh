#!/bin/bash

# AS von Megaspace
# AS34624

iptables -N AS_MEGASPACE_DENY;

iptables -I INPUT -j AS_MEGASPACE_DENY;


curl -s 'https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=34624' | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' > megaspace

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < megaspace | sort | aggregate | xargs -n1 -I% iptables -A AS_MEGASPACE_DENY -s % -j DROP

rm megaspace

exit 0