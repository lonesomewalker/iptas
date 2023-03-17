#!/bin/bash

iptables -A INPUT -s 79.124.90.0/24 -j DROP

exit 0