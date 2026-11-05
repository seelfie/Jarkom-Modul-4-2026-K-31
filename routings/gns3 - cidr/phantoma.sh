echo "=== KONFIGURASI PHANTOMA ==="

IF_SHIBUYA=eth2     # A24 -> Shibuya (sudah terbukti)

# Bersihkan semua config lama
for i in eth0 eth1 eth2 eth3; do
    ip addr flush dev $i
    ip link set $i up
done
ip route flush default

# Cari interface yang tersambung ke Knights (10.79.4.161)
IF_KNIGHTS=""
for i in eth0 eth1 eth3; do
    ip addr add 10.79.4.162/30 dev $i
    if ping -c2 -W1 -I $i 10.79.4.161 >/dev/null 2>&1; then
        IF_KNIGHTS=$i
        echo ">> Knights ditemukan di $i"
        break
    fi
    ip addr flush dev $i
done

if [ -z "$IF_KNIGHTS" ]; then
    echo "!! Tidak ada interface yang menjangkau 10.79.4.161."
    echo "!! Cek di Knights: ip -br a (harus ada 10.79.4.161/30 di eth2)"
    echo "!! Cek link Knights-Phantoma di GNS3, lalu stop/start kedua node."
    exit 1
fi

# Interface sisa = Switch12 (kalau Semi gagal ping, tukar dengan sisa lainnya)
for i in eth0 eth1 eth3; do
    [ "i"!="IF_KNIGHTS" ] && { IF_SWITCH12=$i; break; }
done
echo ">> Switch12 diasumsikan di $IF_SWITCH12"

ip addr add 10.79.4.129/27 dev $IF_SWITCH12   # A23
ip addr add 10.79.4.65/30  dev $IF_SHIBUYA    # A24

sysctl -w net.ipv4.ip_forward=1

ip route add default via 10.79.4.161 dev $IF_KNIGHTS
ip route add 10.79.4.0/26 via 10.79.4.66 dev $IF_SHIBUYA   # A25

echo "=== ROUTING TABLE PHANTOMA ==="
ip route
echo "=== TES ==="
ping -c2 10.79.4.66     # Shibuya
ping -c2 10.79.4.161    # Knights
ping -c2 8.8.8.8        # internet
