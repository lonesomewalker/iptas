#!/bin/bash

# shodan.io	208.180.20.97
# census1.shodan.io	198.20.69.74
# census2.shodan.io	198.20.69.98
# census3.shodan.io	198.20.70.114
# census4.shodan.io	198.20.99.130
# census5.shodan.io	93.120.27.62
# census6.shodan.io	66.240.236.119
# census7.shodan.io	71.6.135.131
# census8.shodan.io	66.240.192.138
# census9.shodan.io	71.6.167.142
# census10.shodan.io	82.221.105.6
# census11.shodan.io	82.221.105.7
# census12.shodan.io	71.6.165.200
# atlantic.census.shodan.io	188.138.9.50
# pacific.census.shodan.io	85.25.103.50
# rim.census.shodan.io	85.25.43.94
# pirate.census.shodan.io	71.6.146.185
# ninja.census.shodan.io	71.6.158.166
# border.census.shodan.io	198.20.87.98
# burger.census.shodan.io	66.240.219.146
# atlantic.dns.shodan.io	209.126.110.38
# blog.shodan.io	104.236.198.48
# hello.data.shodan.io	104.131.0.69
# www.shodan.io	162.159.244.38
# battery.census.shodan.io	93.174.95.106
# cloud.census.shodan.io	94.102.49.193
# dojo.census.shodan.io	80.82.77.139
# flower.census.shodan.io (PTR only)	94.102.49.190
# goldfish.census.shodan.io	185.163.109.66
# house.census.shodan.io	89.248.172.16
# inspire.census.shodan.io (PTR only)	71.6.146.186
# mason.census.shodan.io	89.248.167.131
# ny.private.shodan.io	159.203.176.62
# turtle.census.shodan.io (PTR only)	185.181.102.18
# sky.census.shodan.io	80.82.77.33
# shodan.io (PTR only)	216.117.2.180
# einstein.census.shodan.io	71.6.199.23
# hat.census.shodan.io	185.142.236.34
# red.census.shodan.io	185.165.190.34
# soda.census.shodan.io	71.6.135.131
# wine.census.shodan.io	185.142.236.35
# wall.census.shodan.io	66.240.219.133
# floss.census.shodan.io	143.198.225.197
# dog.census.shodan.io	137.184.95.216
# draft.census.shodan.io	64.227.90.185
# can.census.shodan.io	143.198.238.87
# pack.census.shodan.io	137.184.190.205
# jug.census.shodan.io	137.184.112.192
# elk.census.shodan.io	137.184.190.188
# tab.census.shodan.io	167.172.219.157
# buffet.census.shodan.io	143.110.239.2
# deer.census.shodan.io	143.198.68.20
# sparkle.census.shodan.io	137.184.190.194
# fish.census.shodan.io	137.184.190.246
# heimdal.scan6x.shodan.io	137.184.9.17
# gravy.scanf.shodan.io	137.184.13.100
# scanme.scanf.shodan.io	137.184.94.133
# frame.census.shodan.io	137.184.112.103
# collector.chrono.shodan.io	137.184.180.190
# ships.data.shodan.io	143.198.50.234
# green.census.shodan.io	185.142.236.36
# blue.census.shodan.io	185.142.236.40
# guitar.census.shodan.io	185.142.236.41
# blue2.census.shodan.io	185.142.236.43
# red2.census.shodan.io	185.142.239.16
# census2.shodan.io	198.20.69.96/29
# census3.shodan.io	198.20.70.112/29
# border.census.shodan.io	198.20.87.96/29
# census4.shodan.io	198.20.99.128/29
# malware-hunter.census.shodan.io	66.240.205.34
# refrigerator.census.shodan.io	71.6.146.130
# board.census.shodan.io	71.6.147.198
# tesla.census.shodan.io	71.6.147.254
# thor.data.shodan.io	71.6.150.153
# grimace.data.shodan.io	71.6.167.125
# house.census.shodan.io	89.248.172.7
# manfo.census.shodan.io	165.227.62.247
# kiwi.census.shodan.io	165.227.55.4
# red1.census.shodan.io	216.117.2.180
# red3.census.shodan.io	195.144.21.56
# purple.census.shodan.io	185.165.190.17
# scanner01.project25499.com	98.143.148.107
# scanner02.project25499.com	155.94.254.133
# scanner03.project25499.com	155.94.254.143
# scanner04.project25499.com	155.94.222.12
# scanner05.project25499.com	98.143.148.135
# eigenes AS	207.90.244.0/24

iptables -N AS_SHODAN_DENY;

iptables -I INPUT -j AS_SHODAN_DENY;

iptables -A AS_SHODAN_DENY -s 208.180.20.97 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.69.74 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.69.98 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.70.114 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.99.130 -j DROP
iptables -A AS_SHODAN_DENY -s 93.120.27.62 -j DROP
iptables -A AS_SHODAN_DENY -s 66.240.236.119 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.135.131 -j DROP
iptables -A AS_SHODAN_DENY -s 66.240.192.138 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.167.142 -j DROP
iptables -A AS_SHODAN_DENY -s 82.221.105.6 -j DROP
iptables -A AS_SHODAN_DENY -s 82.221.105.7 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.165.200 -j DROP
iptables -A AS_SHODAN_DENY -s 188.138.9.50 -j DROP
iptables -A AS_SHODAN_DENY -s 85.25.103.50 -j DROP
iptables -A AS_SHODAN_DENY -s 85.25.43.94 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.146.185 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.158.166 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.87.98 -j DROP
iptables -A AS_SHODAN_DENY -s 66.240.219.146 -j DROP
iptables -A AS_SHODAN_DENY -s 209.126.110.38 -j DROP
iptables -A AS_SHODAN_DENY -s 104.236.198.48 -j DROP
iptables -A AS_SHODAN_DENY -s 104.131.0.69 -j DROP
iptables -A AS_SHODAN_DENY -s 162.159.244.38 -j DROP
iptables -A AS_SHODAN_DENY -s 93.174.95.106 -j DROP
iptables -A AS_SHODAN_DENY -s 94.102.49.193 -j DROP
iptables -A AS_SHODAN_DENY -s 80.82.77.139 -j DROP
iptables -A AS_SHODAN_DENY -s 94.102.49.190 -j DROP
iptables -A AS_SHODAN_DENY -s 185.163.109.66 -j DROP
iptables -A AS_SHODAN_DENY -s 89.248.172.16 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.146.186 -j DROP
iptables -A AS_SHODAN_DENY -s 89.248.167.131 -j DROP
iptables -A AS_SHODAN_DENY -s 159.203.176.62 -j DROP
iptables -A AS_SHODAN_DENY -s 185.181.102.18 -j DROP
iptables -A AS_SHODAN_DENY -s 80.82.77.33 -j DROP
iptables -A AS_SHODAN_DENY -s 216.117.2.180 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.199.23 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.236.34 -j DROP
iptables -A AS_SHODAN_DENY -s 185.165.190.34 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.135.131 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.236.35 -j DROP
iptables -A AS_SHODAN_DENY -s 66.240.219.133 -j DROP
iptables -A AS_SHODAN_DENY -s 143.198.225.197 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.95.216 -j DROP
iptables -A AS_SHODAN_DENY -s 64.227.90.185 -j DROP
iptables -A AS_SHODAN_DENY -s 143.198.238.87 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.190.205 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.112.192 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.190.188 -j DROP
iptables -A AS_SHODAN_DENY -s 167.172.219.157 -j DROP
iptables -A AS_SHODAN_DENY -s 143.110.239.2 -j DROP
iptables -A AS_SHODAN_DENY -s 143.198.68.20 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.190.194 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.190.246 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.9.17 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.13.100 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.94.133 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.112.103 -j DROP
iptables -A AS_SHODAN_DENY -s 137.184.180.190 -j DROP
iptables -A AS_SHODAN_DENY -s 143.198.50.234 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.236.36 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.236.40 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.236.41 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.236.43 -j DROP
iptables -A AS_SHODAN_DENY -s 185.142.239.16 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.69.96/29 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.70.112/29 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.87.96/29 -j DROP
iptables -A AS_SHODAN_DENY -s 198.20.99.128/29 -j DROP
iptables -A AS_SHODAN_DENY -s 66.240.205.34 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.146.130 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.147.198 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.147.254 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.150.153 -j DROP
iptables -A AS_SHODAN_DENY -s 71.6.167.125 -j DROP
iptables -A AS_SHODAN_DENY -s 89.248.172.7 -j DROP
iptables -A AS_SHODAN_DENY -s 165.227.62.247 -j DROP
iptables -A AS_SHODAN_DENY -s 165.227.55.4 -j DROP
iptables -A AS_SHODAN_DENY -s 216.117.2.180 -j DROP
iptables -A AS_SHODAN_DENY -s 195.144.21.56 -j DROP
iptables -A AS_SHODAN_DENY -s 185.165.190.17 -j DROP
iptables -A AS_SHODAN_DENY -s 98.143.148.107 -j DROP
iptables -A AS_SHODAN_DENY -s 155.94.254.133 -j DROP
iptables -A AS_SHODAN_DENY -s 155.94.254.143 -j DROP
iptables -A AS_SHODAN_DENY -s 155.94.222.12 -j DROP
iptables -A AS_SHODAN_DENY -s 98.143.148.135 -j DROP
iptables -A AS_SHODAN_DENY -s 207.90.244.0/24 -j DROP

exit 0
