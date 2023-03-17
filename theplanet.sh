#!/bin/bash

iptables -I INPUT -s 184.172.0.0/15 -j DROP

exit 0