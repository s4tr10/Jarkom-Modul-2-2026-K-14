#!/bin/bash
hostname prab
echo "192.218.1.2 prab" >> /etc/hosts

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
    type master;
    file "/etc/bind/db.k14";
    allow-transfer { 192.218.1.3; };
    also-notify { 192.218.1.3; };
};
zone "1.218.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.1";
    allow-transfer { 192.218.1.3; };
    also-notify { 192.218.1.3; };
};
zone "4.218.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.4";
    allow-transfer { 192.218.1.3; };
    also-notify { 192.218.1.3; };
};
zone "5.218.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.5";
    allow-transfer { 192.218.1.3; };
    also-notify { 192.218.1.3; };
};
EOF

cat <<EOF > /etc/bind/db.k14
\$TTL    604800
@       IN      SOA     prab.k14.com. root.k14.com. (
                              2026100103 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL
;
@       IN      NS      prab.k14.com.
@       IN      NS      tedd.k14.com.
@       IN      A       192.218.5.2

prab    IN      A       192.218.1.2
tedd    IN      A       192.218.1.3
rootkit IN      A       192.218.1.1
alpha   IN      A       192.218.6.2
beta    IN      A       192.218.6.3
gamma   IN      A       192.218.6.4
delta   IN      A       192.218.7.2
epsilon IN      A       192.218.7.3
abbey   IN      A       192.218.4.2
penny   IN      A       192.218.5.2
obladi  IN      A       192.218.1.4
desmond IN      A       192.218.1.5
oblada  IN      A       192.218.1.6
molly   IN      A       192.218.1.7

vault   IN      A       192.218.1.4
vault   IN      A       192.218.1.5
core    IN      A       192.218.1.6
core    IN      A       192.218.1.7

www     IN      CNAME   penny
static  IN      CNAME   abbey
EOF

cat <<EOF > /etc/bind/db.1
\$TTL    604800
@       IN      SOA     prab.k14.com. root.k14.com. ( 2026100101 604800 86400 2419200 604800 )
@       IN      NS      prab.k14.com.
@       IN      NS      tedd.k14.com.
4       IN      PTR     vault.k14.com.
5       IN      PTR     vault.k14.com.
6       IN      PTR     core.k14.com.
7       IN      PTR     core.k14.com.
EOF

cat <<EOF > /etc/bind/db.4
\$TTL    604800
@       IN      SOA     prab.k14.com. root.k14.com. ( 2026100101 604800 86400 2419200 604800 )
@       IN      NS      prab.k14.com.
@       IN      NS      tedd.k14.com.
2       IN      PTR     abbey.k14.com.
EOF

cat <<EOF > /etc/bind/db.5
\$TTL    604800
@       IN      SOA     prab.k14.com. root.k14.com. ( 2026100101 604800 86400 2419200 604800 )
@       IN      NS      prab.k14.com.
@       IN      NS      tedd.k14.com.
2       IN      PTR     penny.k14.com.
EOF

pkill named && named