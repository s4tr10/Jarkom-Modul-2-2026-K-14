#!/bin/bash
# Contoh pada node obladi
hostname obladi
echo "192.218.1.4 obladi" >> /etc/hosts

cat <<EOF> /etc/resolv.conf
nameserver 192.218.1.2
nameserver 192.218.1.3
nameserver 192.168.122.1
EOF

apt-get update
apt-get install apache2 -y

mkdir -p /var/www/html/arsip
echo "Ini adalah dokumen rahasia 1" > /var/www/html/arsip/dokumen1.txt
echo "Ini adalah dokumen rahasia 2" > /var/www/html/arsip/dokumen2.txt

cat <<EOF> /etc/apache2/sites-available/vault.conf
<VirtualHost *:80>
    ServerName vault.k14.com
    DocumentRoot /var/www/html

    <Directory /var/www/html/arsip>
        Options +Indexes
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
EOF

a2dissite 000-default.conf
a2ensite vault.conf
service apache2 restart || apache2ctl start