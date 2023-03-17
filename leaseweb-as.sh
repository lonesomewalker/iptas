#!/bin/bash

# AS7203
# AS60781
# AS60626
# AS59253
# AS396362
# AS396190
# AS395954
# AS394380
# AS38930
# AS30878
# AS30633
# AS28753
# AS27411
# AS205544
# AS16265
# AS136988
# AS133752

iptables -N AS_LEASEWEB_DENY;

iptables -I INPUT -j AS_LEASEWEB_DENY;

asarray=("7203" "60781" "60626" "59253" "396362" "396190" "395954" "394380" "38930" "30878" "30633" "28753" "27411" "205544" "16265" "136988" "133752")

for i in ${asarray[@]}; do

	curl -s "https://stat.ripe.net/data/ris-prefixes/data.json?list_prefixes=true&resource=$i" | jq -r '.data.prefixes.v4.originating' | sed '1d;$d;s/"//g;s/,//g;s/ //g' >> lease

done


while read line; do IFS=. read a b c d <<< "${line%/*}"; echo "${a:=0}.${b:=0}.${c:=0}.${d:=0}/${line#*/}"; done < lease | sort | aggregate | xargs -n1 -I% iptables -A AS_LEASEWEB_DENY -s % -j DROP

rm lease

exit 0