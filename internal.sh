#!/bin/bash

read -p "Enter -Internal- server address: " $int_server
read -p "Enter -External- server address: " $ext_server

iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A FORWARD -j ACCEPT

iptalbes -A PREROUTING -d $int_server/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination $ext_server:80
iptalbes -A PREROUTING -d $int_server/32 -p tcp -m tcp --dport 443 -j DNAT --to-destination $ext_server:443
iptalbes -A POSTROUTING -j MASQUERADE


