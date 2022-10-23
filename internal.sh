#!/bin/bash

read -p "Enter -Internal- server address: " INT_SERVER
read -p "Enter -External- server address: " EXT_SERVER

sysctl -w net.ipv4.ip_forward=1

iptables -t filter -D INPUT -p tcp -m tcp --dport 80 -j ACCEPT 2>/dev/null
iptables -t nat -D PREROUTING -d $INT_SERVER/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination $EXT_SERVER:80 2>/dev/null
iptables -t nat -D POSTROUTING -j MASQUERADE 2>/dev/null
iptables -t filter -D FORWARD -j ACCEPT 2>/dev/null

iptables -t filter -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d $INT_SERVER/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination $EXT_SERVER:80
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t filter -A FORWARD -j ACCEPT

echo "0 * * * * /root/fake_traffic.sh" >> /var/spool/cron/crontabs/root
