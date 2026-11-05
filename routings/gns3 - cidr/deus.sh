echo "=== KONFIGURASI DEUS ==="

ip link set eth0 up
ip addr replace 10.79.1.6/30 dev eth0      # A16 -> Tachibana

ip link set eth1 up
ip addr replace 10.79.0.1/25 dev eth1      # A17 -> Switch10 (Lilith, Specter)

ip link set eth2 up
ip addr replace 10.79.0.129/30 dev eth2    # A18 -> Protocol7

sysctl -w net.ipv4.ip_forward=1

ip route replace default via 10.79.1.5
ip route replace 10.79.4.0/23 via 10.79.0.130   # A19 - A25

echo "=== ROUTING TABLE DEUS ==="
ip route
ping -c2 8.8.8.8