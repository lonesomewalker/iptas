#!/bin/bash

# AS49505
# AS57129
# AS202984

iptables -N AS_DOMTEHNIKI_DENY;

iptables -I INPUT -j AS_DOMTEHNIKI_DENY;

asarray=("49505" "57129" "202984")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> domtehniki

done


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < domtehniki | sort | aggregate | xargs -n1 -I% iptables -A AS_DOMTEHNIKI_DENY -s % -j DROP

rm domtehniki

exit 0