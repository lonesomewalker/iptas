#!/bin/bash

# AS von OVH
# AS16276
# AS35540

iptables -N AS_OVH_DENY;

iptables -I INPUT -j AS_OVH_DENY;

asarray=("16276" "35540")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> ovh

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < ovh | sort | aggregate | xargs -n1 -I% iptables -A AS_OVH_DENY -s % -j DROP

rm ovh

iptables -I INPUT -s mx0.mail.ovh.net -j ACCEPT
iptables -I INPUT -s mx1.mail.ovh.net -j ACCEPT
iptables -I INPUT -s mx2.mail.ovh.net -j ACCEPT
iptables -I INPUT -s mx3.mail.ovh.net -j ACCEPT

exit 0