#!/bin/bash

# aktuell bekannte AS:
# AS199264

iptables -N AS_CLOUDFLARE_DENY;

iptables -I INPUT -j AS_CLOUDFLARE_DENY;

asarray=("395747" "395747" "203898" "202623" "14789" "133877" "13335" "132892")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> cloudflare

done

while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < cloudflare | sort | aggregate | xargs -n1 -I% iptables -A AS_CLOUDFLARE_DENY -s % -j DROP

rm cloudflare

iptables -A AS_CLOUDFLARE_DENY -s 103.21.244.0/22 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 103.22.200.0/22 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 103.31.4.0/22 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 104.16.0.0/12 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 108.162.192.0/18 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 131.0.72.0/22 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 141.101.64.0/18 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 162.158.0.0/15 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 172.64.0.0/13 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 173.245.48.0/20 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 188.114.96.0/20 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 190.93.240.0/20 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 197.234.240.0/22 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 198.41.128.0/17 -j DROP
iptables -A AS_CLOUDFLARE_DENY -s 199.27.128.0/21 -j DROP

exit 0
