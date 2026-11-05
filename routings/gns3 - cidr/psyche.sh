echo "=== KONFIGURASI PSYCHE ==="
ALL="eth0 eth1 eth2 eth3"

for i in $ALL; do ip addr flush dev $i; ip link set $i up; done
ip route flush default

# Cari interface ke Switch2 (A3) lewat ping ke Wired
IF_UP=""
for i in $ALL; do
    ip addr add 10.79.20.18/29 dev $i
    if ping -c2 -W1 -I $i 10.79.20.17 >/dev/null 2>&1; then
        IF_UP=$i; echo ">> A3 (Switch2) ditemukan di $i"; break
    fi
    ip addr flush dev $i
done
[ -z "$IF_UP" ] && { echo "!! A3 tidak ketemu. Cek Wired dan link Switch2."; exit 1; }

# Interface sisa pertama = A4 (Switch3)
for i in ALL;do["i" != "$IF_UP" ] && { IF_A4=$i; break; }; done
echo ">> A4 (Switch3) diasumsikan di $IF_A4"

ip addr add 10.79.28.1/22 dev $IF_A4

sysctl -w net.ipv4.ip_forward=1
ip route add default via 10.79.20.17 dev $IF_UP

echo "=== ROUTING TABLE PSYCHE ==="
ip route
echo "=== TES ==="
ping -c2 10.79.20.17    # Wired
ping -c2 8.8.8.8