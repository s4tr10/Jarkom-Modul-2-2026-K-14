### Config Rootkit
```
# /etc/network/interfaces
auto lo
iface lo inet loopback

# Ke NAT (Internet)
auto eth0
iface eth0 inet dhcp

# Ke Switch 1
auto eth1
iface eth1 inet static
    address 192.168.1.1
    netmask 255.255.255.0

# Ke Switch 4
auto eth2
iface eth2 inet static
    address 192.168.4.1
    netmask 255.255.255.0

# Ke Switch 5
auto eth3
iface eth3 inet static
    address 192.168.5.1
    netmask 255.255.255.0

# Ke Switch 6
auto eth4
iface eth4 inet static
    address 192.168.6.1
    netmask 255.255.255.0

# Ke Switch 7
auto eth5
iface eth5 inet static
    address 192.168.7.1
    netmask 255.255.255.0
```

### Config Node Prab
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.2
    netmask 255.255.255.0
    gateway 192.168.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Tedd
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.3
    netmask 255.255.255.0
    gateway 192.168.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Ibladi
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.4
    netmask 255.255.255.0
    gateway 192.168.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Desmond
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.5
    netmask 255.255.255.0
    gateway 192.168.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Oblada
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.6
    netmask 255.255.255.0
    gateway 192.168.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Molly
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.7
    netmask 255.255.255.0
    gateway 192.168.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Abbey
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.4.2
    netmask 255.255.255.0
    gateway 192.168.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Penny
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.5.2
    netmask 255.255.255.0
    gateway 192.168.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Alpha
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.6.2
    netmask 255.255.255.0
    gateway 192.168.6.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Beta
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.6.3
    netmask 255.255.255.0
    gateway 192.168.6.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Gamma
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.6.4
    netmask 255.255.255.0
    gateway 192.168.6.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Delta
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.7.2
    netmask 255.255.255.0
    gateway 192.168.7.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Config Node Epsilon
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.7.3
    netmask 255.255.255.0
    gateway 192.168.7.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```