#!/bin/bash

iptables -I INPUT -s 79.124.64.0/19 -j DROP

exit 0