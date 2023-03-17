#!/bin/bash

# AS von stuart.be
# AS29435

iptables -N AS_STUART_DENY;

iptables -I INPUT -j AS_STUART_DENY;

asarray=("29435")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> stuart

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < stuart | sort | aggregate | xargs -n1 -I% iptables -A AS_STUART_DENY -s % -j DROP

rm stuart

exit 0