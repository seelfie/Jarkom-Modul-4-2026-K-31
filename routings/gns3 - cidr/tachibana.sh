echo "=== KONFIGURASI TACHIBANA ==="

ip link set eth0 up
ip addr replace 10.79.1.2/30 dev eth0     # A14 -> Wired

ip link set eth1 up
ip addr replace 10.79.2.1/23 dev eth1     # A15 -> Switch9 (Collective, Ghost)

ip link set eth2 up
ip addr replace 10.79.1.5/30 dev eth2     # A16 -> Deus

sysctl -w net.ipv4.ip_forward=1

ip route replace default via 10.79.1.1
ip route replace 10.79.0.0/24 via 10.79.1.6   # A17 + A18
ip route replace 10.79.4.0/23 via 10.79.1.6   # A19 - A25

echo "=== ROUTING TABLE TACHIBANA ==="
ip route