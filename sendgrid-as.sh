#!/bin/bash

# AS von Sendgrid
# AS11377

iptables -N AS_SENDGRID_DENY;

iptables -I INPUT -j AS_SENDGRID_DENY;

asarray=("11377")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> sendgrid

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < sendgrid | sort | aggregate | xargs -n1 -I% iptables -A AS_SENDGRID_DENY -s % -j DROP

rm sendgrid

exit 0