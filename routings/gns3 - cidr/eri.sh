ip link set eth0 up
ip addr flush dev eth0
ip addr add 10.79.5.130/29 dev eth0
ip route replace default via 10.79.5.129
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "-------"
ip -br a 
ip route 
ping -c2 8.8.8.8 
ping -c2 google.com
