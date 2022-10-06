#!/bin/bash

read -p "Enter -Internal- server address: " $int_server
read -p "Enter -External- server address: " $ext_server

sysctl -w net.ipv4.ip_forward=1

iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d $int_server/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination $ext_server:80
iptables -t nat -A PREROUTING -d $int_server/32 -p tcp -m tcp --dport 443 -j DNAT --to-destination $ext_server:443
iptables -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -j ACCEPT
