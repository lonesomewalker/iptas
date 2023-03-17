#!/bin/bash

iptables -N AS_RACKSP_DENY;

iptables -I INPUT -j AS_RACKSP_DENY;

asarray=("27357" "58683" "54636" "45187" "44716" "39921" "36248" "33439" "22720" "19994" "15395" "12200" "10532")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> racksp

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < racksp | sort | aggregate | xargs -n1 -I% iptables -A AS_RACKSP_DENY -s % -j DROP

rm racksp

exit 0