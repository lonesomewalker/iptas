#!/bin/bash

# reversed from spf:spf.crsend.com

iptables -I INPUT -s 178.77.121.128/26 -j DROP
iptables -I INPUT -s 158.69.163.48/29 -j DROP
iptables -I INPUT -s 46.4.238.128/29 -j DROP
iptables -I INPUT -s 194.42.96.0/23 -j DROP

exit 0