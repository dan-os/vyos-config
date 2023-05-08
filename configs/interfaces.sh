#!/bin/vbash

# eth0 (public)
set interfaces ethernet eth0 description 'WAN'
set interfaces ethernet eth0 hw-id 'ec:f4:bb:ce:75:45'
set interfaces ethernet eth0 address 'dhcp'

# eth1 (private)
set interfaces ethernet eth1 description 'LAN'
set interfaces ethernet eth1 hw-id 'ec:f4:bb:ce:75:46'
set interfaces ethernet eth1 address '10.1.0.1/24'
set interfaces ethernet eth1 vif 10 description 'SERVERS'
set interfaces ethernet eth1 vif 10 address '10.1.1.1/24'
set interfaces ethernet eth1 vif 20 description 'TRUSTED'
set interfaces ethernet eth1 vif 20 address '10.1.2.1/24'
set interfaces ethernet eth1 vif 30 description 'GUEST'
set interfaces ethernet eth1 vif 30 address '192.168.2.1/24'
set interfaces ethernet eth1 vif 40 description 'IOT'
set interfaces ethernet eth1 vif 40 address '10.1.3.1/24'
set interfaces ethernet eth1 vif 50 description 'MANAGEMENT'
set interfaces ethernet eth1 vif 50 address '10.1.4.1/24'

# eth2 (uplink for UDMP)
set interfaces ethernet eth2 description 'LAN2'
set interfaces ethernet eth2 hw-id 'ec:f4:bb:ce:75:47'
set interfaces ethernet eth2 address '172.16.0.1/24'

# Wireguard
set interfaces wireguard wg01 description 'WIREGUARD'
set interfaces wireguard wg01 address '10.0.11.1/24'
set interfaces wireguard wg01 port '51820'
set interfaces wireguard wg01 private-key "${SECRET_WIREGUARD_PRIVATE_KEY}"
set interfaces wireguard wg01 peer dan-macbook persistent-keepalive '15'
set interfaces wireguard wg01 peer dan-macbook allowed-ips '10.0.11.2/32'
set interfaces wireguard wg01 peer dan-macbook public-key '7TlCptbATBQvnEghLqnSriP1uFFoPGqnaQ9lMXWShiE='
