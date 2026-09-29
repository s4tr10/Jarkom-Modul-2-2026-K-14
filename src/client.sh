#!/bin/bash
# Contoh pada node Alpha
hostname alpha
echo "192.168.6.2 alpha" >> /etc/hosts

cat <<EOF> /etc/resolv.conf
nameserver 192.168.1.2
nameserver 192.168.1.3
nameserver 192.168.122.1
EOF