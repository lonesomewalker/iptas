#!/bin/bash

# AS von NovoServe B.V.
# AS24875
# AS21159

iptables -N AS_NOVOSERVE_DENY;

iptables -I INPUT -j AS_NOVOSERVE_DENY;

asarray=("24875" "21159")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> novoserve

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < novoserve | sort | aggregate | xargs -n1 -I% iptables -A AS_NOVOSERVE_DENY -s % -j DROP

rm novoserve

exit 0