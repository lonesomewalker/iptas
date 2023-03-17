#!/bin/bash

# Einzel-IPs
iptables -I INPUT -s 144.76.249.182 -j DROP
iptables -I INPUT -s 144.76.249.181 -j DROP
iptables -I INPUT -s 144.76.249.180 -j DROP
iptables -I INPUT -s 144.76.99.141 -j DROP
iptables -I INPUT -s 46.4.219.134 -j DROP
iptables -I INPUT -s 78.46.93.66 -j DROP
iptables -I INPUT -s 88.198.64.240 -j DROP
iptables -I INPUT -s 88.198.64.250 -j DROP
iptables -I INPUT -s 88.198.64.252 -j DROP

# Subnetze laut http://mxtoolbox.com/SuperTool.aspx?action=txt%3aspf.nl2go.com&run=toolpage
iptables -I INPUT -s 192.138.90.192/26 -j DROP
iptables -I INPUT -s 88.198.181.208/28 -j DROP
iptables -I INPUT -s 88.198.96.0/27 -j DROP
iptables -I INPUT -s 178.63.169.208/28 -j DROP
iptables -I INPUT -s 88.198.249.64/28 -j DROP
iptables -I INPUT -s 46.4.145.64/28 -j DROP
iptables -I INPUT -s 178.63.165.160/28 -j DROP

iptables -I INPUT -s 78.46.88.157 -j DROP
iptables -I INPUT -s 62.138.82.95 -j DROP
iptables -I INPUT -s 62.138.82.96 -j DROP
iptables -I INPUT -s 62.138.82.97 -j DROP
iptables -I INPUT -s 46.4.133.23 -j DROP
iptables -I INPUT -s 46.4.133.24 -j DROP
iptables -I INPUT -s 46.4.133.9 -j DROP
iptables -I INPUT -s 85.10.205.195 -j DROP
iptables -I INPUT -s 46.4.90.214 -j DROP
iptables -I INPUT -s 46.4.90.217 -j DROP
iptables -I INPUT -s 88.198.44.91 -j DROP
iptables -I INPUT -s 88.198.44.89 -j DROP
iptables -I INPUT -s 78.46.88.146 -j DROP
iptables -I INPUT -s 78.46.88.156 -j DROP

iptables -I INPUT -s 46.4.133.12 -j DROP
iptables -I INPUT -s 46.4.133.19 -j DROP
iptables -I INPUT -s 176.9.9.98 -j DROP
iptables -I INPUT -s 46.4.90.213 -j DROP
iptables -I INPUT -s 78.47.17.148 -j DROP
iptables -I INPUT -s 176.9.9.121 -j DROP
iptables -I INPUT -s 78.46.69.8 -j DROP
iptables -I INPUT -s 78.46.94.4 -j DROP
iptables -I INPUT -s 85.10.205.196 -j DROP
iptables -I INPUT -s 213.239.218.84 -j DROP
iptables -I INPUT -s 88.198.16.201 -j DROP
iptables -I INPUT -s 62.138.90.192/26 -j DROP

exit 0