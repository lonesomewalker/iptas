#!/bin/bash

# AS von Linode
# AS63949
# AS48337

iptables -N AS_LINODE_DENY;

iptables -I INPUT -j AS_LINODE_DENY;

asarray=("63949" "48337")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> linode

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < linode | sort | aggregate | xargs -n1 -I% iptables -A AS_LINODE_DENY -s % -j DROP

rm linode

exit 0