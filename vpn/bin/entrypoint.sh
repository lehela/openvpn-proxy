#!/bin/bash

VPN_CONF=/etc/openvpn/default.conf
echo "Using config file : " $VPN_CONF

# echo "Disabling firewall"
# ufw disable

echo "Starting vpn client"
openvpn \
    --config $VPN_CONF \
    --setenv PATH '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' \
    --auth-user-pass /etc/openvpn/credentials.txt \
    --script-security 2 \
    --down /etc/openvpn/update-resolv-conf \
    --up /etc/openvpn/update-resolv-conf \
    --down-pre &

sleep 15

echo "Starting squid server"
service squid start
echo "Squid server is running"

echo "Ready to accept connections..."
while true; do sleep 1000; done

