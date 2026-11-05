echo "=== KONFIGURASI ACCELA ==="
ALL="eth0 eth1 eth2 eth3"

for i in $ALL; do ip addr flush dev $i; ip link set $i up; done
ip route flush default

# Cari interface ke Schumann (A8)
IF_UP=""
for i in $ALL; do
    ip addr add 10.79.20.10/30 dev $i
    if ping -c2 -W1 -I $i 10.79.20.9 >/dev/null 2>&1; then
        IF_UP=$i; echo ">> A8 (Schumann) ditemukan di $i"; break
    fi
    ip addr flush dev $i
done

if [ -z "$IF_UP" ]; then
    IF_UP=eth0
    ip addr add 10.79.20.10/30 dev $IF_UP
    echo "!! Schumann belum terdeteksi, A8 sementara dipasang di $IF_UP."
    echo "!! Jalankan ulang schumann.sh (dia akan mencari Accela), lalu jalankan ulang accela.sh."
fi

# Sisa pertama = A9 (Switch5)
for i in ALL;do["i" != "$IF_UP" ] && { IF_A9=$i; break; }; done
echo ">> A9 (Switch5) diasumsikan di $IF_A9"
ip addr add 10.79.16.1/22 dev $IF_A9

sysctl -w net.ipv4.ip_forward=1
ip route add default via 10.79.20.9 dev $IF_UP

echo "=== ROUTING TABLE ACCELA ==="
ip route
echo "=== TES ==="
ping -c2 10.79.20.9     # Schumann
ping -c2 10.79.20.17    # Wired
ping -c2 8.8.8.8    