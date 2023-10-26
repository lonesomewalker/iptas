#!/bin/bash

iptables -N AS_AMZNCOM_DENY;

iptables -I INPUT -j AS_AMZNCOM_DENY;

asarray=("9059" "8987" "801" "7224" "699" "62785" "58588" "40045" "400098" "399991" "399834" "395343" "39111" "38895" "36263" "264167" "21664" "19047" "17493" "16509" "14618" "135630" "10124")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> amzncom

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < amzncom | sort | aggregate | xargs -n1 -I% iptables -A AS_AMZNCOM_DENY -s % -j DROP

rm amzncom

exit 0
