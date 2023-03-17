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
# house.census.shodan.io	89.248.172.16

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
iptables -A AS_SHODAN_DENY -s 89.248.172.16 -j DROP

exit 0