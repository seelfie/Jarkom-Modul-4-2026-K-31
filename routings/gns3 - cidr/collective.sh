IP=10.79.12.10        
PREFIX=25           
GW=10.79.12.1     
IF=eth0

echo "=== KONFIGURASI HOST $IP ==="
ip addr flush dev $IF
ip link set $IF up
ip addr add IP/PREFIX dev $IF
ip route flush default
ip route add default via $GW dev $IF
echo "nameserver 8.8.8.8" > /etc/resolv.conf

ip -br a
ip route
echo "=== TES ==="
ping -c2 $GW
ping -c2 8.8.8.8