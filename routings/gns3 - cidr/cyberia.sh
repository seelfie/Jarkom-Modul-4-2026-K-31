echo "=== KONFIGURASI CYBERIA ==="

# 1. Interface ke NAT1 (dapat IP dari DHCP NAT GNS3)
ip link set eth0 up
dhclient eth0

# 2. Konfigurasi IP Address
ip link set eth1 up
ip addr replace 10.79.12.1/25 dev eth1

ip link set eth2 up
ip addr replace 10.79.12.129/30 dev eth2

# 3. Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# 4. Static Routing menuju Wired
ip route replace 10.79.0.0/21 via 10.79.12.130
ip route replace 10.79.8.0/22 via 10.79.12.130
ip route replace 10.79.16.0/20 via 10.79.12.130

# 5. NAT supaya seluruh jaringan 10.79.x.x bisa keluar internet
iptables -t nat -A POSTROUTING -s 10.79.0.0/16 -o eth0 -j MASQUERADE

echo "=== ROUTING TABLE CYBERIA ==="
ip route
