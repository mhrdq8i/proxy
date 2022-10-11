#!/bin/bash

read -p "Enter -Internal- server address: " $int_server
read -p "Enter -External- server address: " $ext_server

sysctl -w net.ipv4.ip_forward=1

iptables -t filter -D INPUT -p tcp -m tcp --dport 80 -j ACCEPT 2>/dev/null
iptables -t nat -D PREROUTING -d $int_server/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination $ext_server:80 2>/dev/null
iptables -t nat -D PREROUTING -d $int_server/32 -p tcp -m tcp --dport 443 -j DNAT --to-destination $ext_server:443 2>/dev/null
iptables -t nat -D POSTROUTING -j MASQUERADE 2>/dev/null
iptables -t filter -D FORWARD -j ACCEPT 2>/dev/null

iptables -t filter -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d $int_server/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination $ext_server:80
iptables -t nat -A PREROUTING -d $int_server/32 -p tcp -m tcp --dport 443 -j DNAT --to-destination $ext_server:443
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t filter -A FORWARD -j ACCEPT
