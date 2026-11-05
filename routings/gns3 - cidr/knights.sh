echo "=== KONFIGURASI KNIGHTS ==="

IF_PROTO7=eth0     # A20 -> Protocol7
IF_ERI=eth1        # A21 -> Eri
IF_PHANTOMA=eth2   # A22 -> Phantoma

# Bersihkan semua config lama
for i in eth0 eth1 eth2 eth3; do
    ip addr flush dev $i
    ip link set $i up
done
ip route flush default

ip addr add 10.79.5.66/30  dev $IF_PROTO7
ip addr add 10.79.5.129/29 dev $IF_ERI
ip addr add 10.79.4.161/30 dev $IF_PHANTOMA

sysctl -w net.ipv4.ip_forward=1

ip route add default via 10.79.5.65 dev $IF_PROTO7
ip route add 10.79.4.0/24 via 10.79.4.162 dev $IF_PHANTOMA   # A22 - A25

echo "=== ROUTING TABLE KNIGHTS ==="
ip route
echo "=== TES ==="
ping -c2 10.79.5.65     # Protocol7
ping -c2 10.79.4.162    # Phantoma