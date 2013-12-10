tayga --mktun
ip link set nat64 up
ip addr add 2001:db8:1::1 dev nat64  
ip addr add 192.168.0.1 dev nat64   
ip route add 2001:db8:1:ffff::/96 dev nat64  
ip route add 192.168.255.0/24 dev nat64      
tayga -d

#sysctl -w net.ipv4.conf.all.forwarding=1
#sysctl -w net.ipv6.conf.all.forwarding=1
