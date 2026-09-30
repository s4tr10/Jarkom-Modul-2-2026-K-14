#!/bin/bash
hostname tedd
echo "192.218.1.3 tedd" >> /etc/hosts

cat <<EOF> /etc/resolv.conf
nameserver 192.218.1.2
nameserver 192.218.1.3
nameserver 192.168.122.1
EOF

apt-get update
apt-get install bind9 bind9utils bind9-doc dnsutils -y

cat <<EOF > /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";
        forwarders { 192.168.122.1; };
        allow-query { any; };
        dnssec-validation auto;
        listen-on-v6 { any; };
};
EOF

cat <<EOF > /etc/bind/named.conf.local
zone "k14.com" {
    type slave;
    masters { 192.218.1.2; };
    file "/var/cache/bind/db.k14";
};
zone "1.218.192.in-addr.arpa" {
    type slave;
    masters { 192.218.1.2; };
    file "/var/cache/bind/db.1";
};
zone "4.218.192.in-addr.arpa" {
    type slave;
    masters { 192.218.1.2; };
    file "/var/cache/bind/db.4";
};
zone "5.218.192.in-addr.arpa" {
    type slave;
    masters { 192.218.1.2; };
    file "/var/cache/bind/db.5";
};
EOF

pkill named && named