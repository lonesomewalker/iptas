#!/bin/bash

iptables -A INPUT -s 91.200.12.0/22 -j DROP

exit 0
