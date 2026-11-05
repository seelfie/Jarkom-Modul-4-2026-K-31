#!/bin/bash
echo "=== KONFIGURASI SCHUMANN ==="
ALL="eth0 eth1 eth2 eth3"

for i in $ALL; do ip addr flush dev $i; ip link set $i up; done
ip route flush default

# A3 (Switch2)
IF_UP=""
for i in $ALL; do
    ip addr add 10.79.20.20/29 dev $i
    if ping -c2 -W1 -I $i 10.79.20.17 >/dev/null 2>&1; then
        IF_UP=$i; echo ">> A3 (Switch2) ditemukan di $i"; break
    fi
    ip addr flush dev $i
done
[ -z "$IF_UP" ] && { echo "!! A3 tidak ketemu. Cek Wired dan link Switch2."; exit 1; }

REST=""
for i in ALL;do["i" != "IFUP"]&&REST="REST $i"; done

# A8 (Accela): coba deteksi lewat ping ke 10.79.20.10 (berhasil kalau Accela sudah jalan)
IF_A8=""
for i in $REST; do
    ip addr add 10.79.20.9/30 dev $i
    if ping -c2 -W1 -I $i 10.79.20.10 >/dev/null 2>&1; then
        IF_A8=$i; echo ">> A8 (Accela) ditemukan di $i"; break
    fi
    ip addr flush dev $i
done

if [ -z "$IF_A8" ]; then
    set -- $REST
    IF_A8=$2
    echo ">> Accela belum terdeteksi, A8 diasumsikan di $IF_A8"
    ip addr add 10.79.20.9/30 dev $IF_A8
fi

# Sisa = A7 (Akashic)
for i in REST;do["i" != "$IF_A8" ] && { IF_A7=$i; break; }; done
echo ">> A7 (Akashic) diasumsikan di $IF_A7"
ip addr add 10.79.20.1/29 dev $IF_A7

sysctl -w net.ipv4.ip_forward=1
ip route add default via 10.79.20.17 dev $IF_UP
ip route add 10.79.16.0/22 via 10.79.20.10 dev $IF_A8    # A9 lewat Accela

echo "=== ROUTING TABLE SCHUMANN ==="
ip route
echo "=== TES ==="
ping -c2 10.79.20.17    # Wired
ping -c2 10.79.20.10    # Accela
ping -c2 8.8.8.8

