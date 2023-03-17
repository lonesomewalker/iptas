#!/bin/bash

# aktuell bekannte AS:
# AS53889

iptables -N AS_MICFO_DENY;

iptables -I INPUT -j AS_MICFO_DENY;

asarray=("53889")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> micfo

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < micfo | sort | aggregate | xargs -n1 -I% iptables -A AS_MICFO_DENY -s % -j DROP

rm micfo

exit 0