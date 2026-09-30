#!/bin/bash
# Contoh pada node Oblada
hostname oblada
echo "192.218.1.6 oblada" >> /etc/hosts

cat <<EOF> /etc/resolv.conf
nameserver 192.218.1.2
nameserver 192.218.1.3
nameserver 192.168.122.1
EOF

apt-get update
apt-get install nginx php-fpm -y

sed -i 's/^listen = .*/listen = 127.0.0.1:9000/' /etc/php/*/fpm/pool.d/www.conf
/etc/init.d/php*-fpm start || /etc/init.d/php*-fpm restart

cat <<EOF> /var/www/html/index.php
<?php echo "<h1>Selamat Datang di Beranda Area Core</h1>"; ?>
EOF

cat <<EOF> /var/www/html/profil.php
<?php echo "<h1>Ini adalah Halaman Profil Area Core</h1>"; ?>
EOF

cat <<EOF> /etc/nginx/sites-available/core.conf
server {
    listen 80;
    server_name core.k14.com;
    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ \$uri.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass 127.0.0.1:9000;
    }
}
EOF

rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/core.conf /etc/nginx/sites-enabled/
service nginx restart || nginx -s reload