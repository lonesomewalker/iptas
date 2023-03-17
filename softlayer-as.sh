#!/bin/bash

# AS von Softlayer
# AS46704
# AS46703
# AS46702
# AS36420
# AS36351
# AS30315
# AS21844
# AS13884
# AS13749

iptables -N AS_SOFTLAYER_DENY;

iptables -I INPUT -j AS_SOFTLAYER_DENY;

asarray=("46704" "46703" "46702" "36420" "36351" "30315" "21844" "13884" "13749")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> soft

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < soft | sort | aggregate | xargs -n1 -I% iptables -A AS_SOFTLAYER_DENY -s % -j DROP

rm soft

exit 0