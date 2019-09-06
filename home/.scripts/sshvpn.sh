#!/bin/bash

server_ip="46.4.32.58"
dns_server_ip=$(cat /etc/resolv.conf | rg nameserver | cut -d' ' -f2)
gateway_ip=$(ip route show dev wlp3s0 | rg "default via" | cut -d' ' -f3)

echo $server_ip
echo $dns_server_ip
echo $gateway_ip

ssh -TND 4711 jarvis
ip tuntap add dev tun0 mode tun user nuke
ip addr replace 10.0.0.1/24 dev tun0
badvpn --tundev tun0 --netif-ipaddr 10.0.0.2 --netif-netmask 255.255.255.0 --socks-server-addr localhost:4711
ip route add $server_ip via $gateway_ip metric 5
ip route add $dns_server_ip via $gateway_ip metric 5
ip route add default via 10.0.0.2 metric 6
