echo "=== KONFIGURASI COPLAND ==="
ALL="eth0 eth1 eth2 eth3"

for i in $ALL; do ip addr flush dev $i; ip link set $i up; done
ip route flush default

IF_UP=""
for i in $ALL; do
    ip addr add 10.79.20.19/29 dev $i
    if ping -c2 -W1 -I $i 10.79.20.17 >/dev/null 2>&1; then
        IF_UP=$i; echo ">> A3 (Switch2) ditemukan di $i"; break
    fi
    ip addr flush dev $i
done
[ -z "$IF_UP" ] && { echo "!! A3 tidak ketemu. Cek Wired dan link Switch2."; exit 1; }

# Dua interface sisa: pertama = A5 (Juri), kedua = A6 (Switch4)
REST=""
for i in ALL;do["i" != "IFUP"]&&REST="REST $i"; done
set -- $REST
IF_A5=$1
IF_A6=$2
echo ">> A5 (Juri) diasumsikan di $IF_A5, A6 (Switch4) di $IF_A6"

ip addr add 10.79.26.1/26 dev $IF_A5    # A5
ip addr add 10.79.24.1/23 dev $IF_A6    # A6

sysctl -w net.ipv4.ip_forward=1
ip route add default via 10.79.20.17 dev $IF_UP

echo "=== ROUTING TABLE COPLAND ==="
ip route
echo "=== TES ==="
ping -c2 10.79.20.17
ping -c2 8.8.8.8