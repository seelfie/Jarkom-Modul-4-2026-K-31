echo "=== KONFIGURASI WIRED ==="

# 1. Konfigurasi IP Address
ip link set eth0 up
ip addr replace 10.79.12.130/30 dev eth0   # A2  -> Cyberia

ip link set eth1 up
ip addr replace 10.79.20.17/29 dev eth1    # A3  -> Switch2 (Psyche, Copland, Schumann)

ip link set eth2 up
ip addr replace 10.79.9.1/30 dev eth2      # A10 -> Navi

ip link set eth3 up
ip addr replace 10.79.1.1/30 dev eth3      # A14 -> Tachibana

# 2. Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# 3. Static Routing
# Via Navi (A11, A12, A13) -> 10.79.8.0 - 10.79.11.255
ip route replace 10.79.8.0/22 via 10.79.9.2

# Via Tachibana (A15 - A25) -> 10.79.0.0 - 10.79.7.255
ip route replace 10.79.0.0/21 via 10.79.1.2

# Via Psyche (A4)
ip route replace 10.79.28.0/22 via 10.79.20.18

# Via Copland (A5 + A6) -> 10.79.24.0 - 10.79.27.255
ip route replace 10.79.24.0/22 via 10.79.20.19

# Via Schumann (A7 + A8) -> 10.79.20.0 - 10.79.20.15
ip route replace 10.79.20.0/28 via 10.79.20.20
# Via Schumann -> Accela (A9)
ip route replace 10.79.16.0/22 via 10.79.20.20

# 4. Default Route menuju Cyberia (internet)
ip route replace default via 10.79.12.129

echo "=== ROUTING TABLE WIRED ==="
ip route