#!/bin/bash

iptables -A INPUT -s 46.29.16.0/21 -j DROP &&
iptables -A INPUT -s 91.229.212.0/24 -j DROP &&
iptables -A INPUT -s 91.234.217.0/24 -j DROP &&
iptables -A INPUT -s 155.133.38.0/24 -j DROP &&
iptables -A INPUT -s 155.133.64.0/24 -j DROP &&
iptables -A INPUT -s 155.133.82.0/24 -j DROP &&
iptables -A INPUT -s 156.67.106.0/24 -j DROP &&
iptables -A INPUT -s 185.38.248.0/22 -j DROP &&
iptables -A INPUT -s 188.68.224.0/20 -j DROP &&
iptables -A INPUT -s 188.68.240.0/20 -j DROP &&
iptables -A INPUT -s 191.96.35.0/24 -j DROP &&
iptables -A INPUT -s 193.42.147.0/24 -j DROP &&
iptables -A INPUT -s 195.22.126.0/23 -j DROP

exit 0
