#!/bin/bash

PUBLIC_PORT=3128
SQUID_HOST=con_openvpn
SQUID_PORT=3128

nc -z $SQUID_HOST $SQUID_PORT
while [ $? == 1 ] 
do 
    echo "Waiting for VPN container..."
    sleep 2
    nc -z $SQUID_HOST $SQUID_PORT
done

echo "Start port forwarding"
socat TCP-LISTEN:$PUBLIC_PORT,fork TCP:$SQUID_HOST:$SQUID_PORT &
echo "Listening on port $PUBLIC_PORT"
echo

echo "Connected to ..."
ext_ip.sh

echo "Ready to accept connections..."
while true; do sleep 1000; done
