#!/bin/bash
hostname rootkit
echo "192.168.1.1 rootkit" >> /etc/hosts

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE