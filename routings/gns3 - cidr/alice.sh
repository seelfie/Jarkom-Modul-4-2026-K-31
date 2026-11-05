ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.79.10.10/24 dev eth0
ip route replace default via 10.79.10.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo “-------”
ip -br a 
ip route 
ping -c2 8.8.8.8 
