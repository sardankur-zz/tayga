tayga --mktun
ip link set nat64 up
ip addr add 2001:db8:1::1 dev nat64
ip addr add 2001:db8:1:4444::1 dev nat64 
ip addr add 192.168.0.1 dev nat64
ip addr add 192.168.0.2 dev nat64      
ip route add 2001:db8:1:ffff::/96 dev nat64  
ip route add 192.168.255.0/24 dev nat64      
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -o nat64 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i nat64 -o wlan0 -j ACCEPT
bash -c 'echo 1 > /proc/sys/net/ipv4/conf/all/forwarding'
bash -c 'echo 1 > /proc/sys/net/ipv6/conf/all/forwarding'
/etc/init.d/bind9 start
#sysctl -w net.ipv4.conf.all.forwarding=1
#sysctl -w net.ipv6.conf.all.forwarding=1

tayga -d
