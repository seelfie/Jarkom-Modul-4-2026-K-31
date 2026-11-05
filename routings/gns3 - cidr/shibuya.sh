echo "=== KONFIGURASI SHIBUYA ==="

# Bersihkan semua config lama
for i in eth0 eth1 eth2 eth3; do
    ip addr flush dev $i 2>/dev/null
    ip link set $i up 2>/dev/null
done
ip route flush default

# Cari interface yang tersambung ke Phantoma (10.79.4.65)
IF_PHANTOMA=""
for i in eth0 eth1 eth2 eth3; do
    ip addr add 10.79.4.66/30 dev $i
    if ping -c2 -W1 -I $i 10.79.4.65 >/dev/null 2>&1; then
        IF_PHANTOMA=$i
        echo ">> Phantoma ditemukan di $i"
        break
    fi
    ip addr flush dev $i
done

if [ -z "$IF_PHANTOMA" ]; then
    echo "!! Tidak ada interface yang menjangkau 10.79.4.65."
    echo "!! Pastikan phantoma.sh sudah dijalankan dan sukses."
    exit 1
fi

# Interface ke Switch13: ambil interface lain yang bukan ke Phantoma
IF_SWITCH13=""
for i in eth0 eth1 eth2 eth3; do
    [ "i"!="IF_PHANTOMA" ] && { IF_SWITCH13=$i; break; }
done
echo ">> Switch13 diasumsikan di $IF_SWITCH13"

ip addr add 10.79.4.1/26 dev $IF_SWITCH13    # A25

sysctl -w net.ipv4.ip_forward=1

ip route add default via 10.79.4.65 dev $IF_PHANTOMA

echo "=== ROUTING TABLE SHIBUYA ==="
ip route
echo "=== TES ==="
ping -c2 10.79.4.65     # Phantoma
ping -c2 10.79.4.161    # Knights
ping -c2 10.79.1.1      # Wired
ping -c2 8.8.8.8        # internet