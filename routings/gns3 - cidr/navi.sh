# 1. Konfigurasi IP Address
ip link set eth0 up
ip addr replace 10.79.9.2/30 dev eth0     # A10 -> Wired

ip link set eth1 up
ip addr replace 10.79.10.1/24 dev eth1    # A11 -> Switch6 (Alice, Reika)

ip link set eth2 up
ip addr replace 10.79.11.1/26 dev eth2    # A12 -> Switch7 (Taro)

ip link set eth3 up
ip addr replace 10.79.8.1/24 dev eth3     # A13 -> Switch8 (Yasuo, Miho, Kuma)

# 2. Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# 3. Default Route menuju Wired (semua tujuan di luar A10-A13)
ip route replace default via 10.79.9.1

echo "=== ROUTING TABLE NAVI ==="
ip route
Ip -c2 8.8.8.8