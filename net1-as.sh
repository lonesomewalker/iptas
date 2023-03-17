#!/bin/bash

# AS von Net1 Ltd.
# AS43561

iptables -N AS_NETONE_DENY;

iptables -I INPUT -j AS_NETONE_DENY;


curl -s 'https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=43561' | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' > netone


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < netone | sort | aggregate | xargs -n1 -I% iptables -A AS_NETONE_DENY -s % -j DROP

rm netone

exit 0