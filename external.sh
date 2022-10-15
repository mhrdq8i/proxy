#!/bin/bash

read -p "Enter -IR- server address: " ir_server

# Add iptables rules
iptables -t filter -D INPUT -s $ir_server/32 -p tcp -m tcp --dport 80  -j ACCEPT 2>/dev/null
iptables -t filter -D INPUT -s $ir_server/32 -p tcp -m tcp --dport 443  -j ACCEPT 2>/dev/null

iptables -t filter -A INPUT -s $ir_server/32 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -s $ir_server/32 -p tcp -m tcp --dport 443 -j ACCEPT

# Install docker and docker-compose
apt update -y
apt install -y docker.io docker-compose

# Gather host information
UUID=$(cat /proc/sys/kernel/random/uuid)
AID=10
IP=$(hostname -I | cut -d' ' -f1)
PORT=80
NETW=ws
WSPATH=/graphql

# Generate config.json
cat > config.json << conf
{
  "log": {
    "loglevel": "warning",
    "access": "/var/log/v2ray/access.log"
  },
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "vmess",
      "allocate": {
        "strategy": "always"
      },
      "settings": {
        "clients": [
          {
            "id": "$UUID",
            "level": 1,
            "alterId": $AID,
            "email": "client@example.com"
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "$NETW",
        "wsSettings": {
          "connectionReuse": true,
          "path": "$WSPATH"
        },
        "security": "none",
        "tcpSettings": {
          "header": {
            "type": "http",
            "response": {
              "version": "1.1",
              "status": "200",
              "reason": "OK",
              "headers": {
                "Content-Type": [
                  "application/octet-stream",
                  "application/x-msdownload",
                  "text/html",
                  "application/x-shockwave-flash"
                ],
                "Transfer-Encoding": ["chunked"],
                "Connection": ["keep-alive"],
                "Pragma": "no-cache"
              }
            }
          }
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    }
  ]
} 
conf

# Run docker container
docker-compose up -d

# User output
printf "SET These to your v2ray client.\n"
echo "* IP: $IP"
echo "* Port: $PORT"
echo "* UUID: $UUID"
echo "* Alter-ID: $AID"
echo "* Encryption: auto"
echo "* Network: $NETW"
echo "* ws path: $WSPATH"
