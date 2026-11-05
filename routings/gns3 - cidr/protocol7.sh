echo "=== KONFIGURASI PROTOCOL7 ==="

ip link set eth0 up
ip addr replace 10.79.0.130/30 dev eth0    # A18 -> Deus

ip link set eth1 up
ip addr replace 10.79.5.1/26 dev eth1      # A19 -> Switch11 (Chisa, Hodgeson)

ip link set eth2 up
ip addr replace 10.79.5.65/30 dev eth2     # A20 -> Knights

sysctl -w net.ipv4.ip_forward=1

ip route replace default via 10.79.0.129
ip route replace 10.79.5.128/29 via 10.79.5.66   # A21
ip route replace 10.79.4.0/24 via 10.79.5.66     # A22 - A25

echo "=== ROUTING TABLE PROTOCOL7 ==="
ip route
ping -c2 8.8.8.8