#!/bin/bash

iptables -I INPUT -s 185.229.240.0/22 -j DROP
iptables -I INPUT -s 185.235.12.0/23 -j DROP
iptables -I INPUT -s 185.235.14.0/24 -j DROP
iptables -I INPUT -s 185.235.15.0/24 -j DROP

exit 0

