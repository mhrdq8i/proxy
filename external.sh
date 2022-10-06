#!/bin/bash

read -p "Enter -IR- server address: " ir_server

# Install docker and docker-compose
apt update -y
apt install -y docker.io docker-compose

# Add iptables rules
iptables -A INPUT -s $ir_server/32 -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -s $ir_server/32 -p tcp -m tcp --dport 80 -j ACCEPT

