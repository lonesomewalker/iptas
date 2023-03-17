#!/bin/bash

# AS von emax global
# AS133694
# AS132779
# AS59165


iptables -N AS_EMAXGLOBAL_DENY;

iptables -I INPUT -j AS_EMAXGLOBAL_DENY;

asarray=("133694" "132779" "59165")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> emax

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < emax | sort | aggregate | xargs -n1 -I% iptables -A AS_EMAXGLOBAL_DENY -s % -j DROP

rm emax

exit 0