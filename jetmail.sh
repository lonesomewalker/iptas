#!/bin/bash

iptables -I INPUT -s 185.149.120.0/22 -j DROP

exit 0