#!/bin/vbash

# set service dhcp-server hostfile-update
# set service dhcp-server host-decl-name

# Option 43 for Unifi
set service dhcp-server global-parameters 'option space ubnt;'
set service dhcp-server global-parameters 'option ubnt.unifi-address code 1 = ip-address;'
set service dhcp-server global-parameters 'class &quot;ubnt&quot; {'
set service dhcp-server global-parameters 'match if substring (option vendor-class-identifier, 0, 4) = &quot;ubnt&quot;;'
set service dhcp-server global-parameters 'option vendor-class-identifier &quot;ubnt&quot;;'
set service dhcp-server global-parameters 'vendor-option-space ubnt;'
set service dhcp-server global-parameters '}'

# LAN
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 default-router '10.1.0.1'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 lease '86400'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 range 0 start '10.1.0.200'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 range 0 stop '10.1.0.254'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 subnet-parameters 'option ubnt.unifi-address 10.1.0.10;'

# set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping unifi-controller ip-address '10.1.0.10'
# set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping unifi-controller mac-address '6a:d7:9a:50:31:ca' # UDM-Pro LAN
# LAN Switches
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping switch01 ip-address '10.1.0.11'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping switch01 mac-address '68:d7:9a:63:2c:41' # USW-Lite-8-POE
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping switch02 ip-address '10.1.0.12'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping switch02 mac-address '24:5a:4c:17:c3:be' # USW-Pro-48-POE
# LAN APs
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping ap01 ip-address '10.1.0.21'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping ap01 mac-address '68:d7:9a:4d:d2:82' # UAP-FlexHD
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping ap02 ip-address '10.1.0.22'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping ap02 mac-address 'f4:92:bf:ac:42:4c' # U6-Lite

# LAN2 (UDMP port)
set service dhcp-server shared-network-name LAN2 authoritative
set service dhcp-server shared-network-name LAN2 ping-check
set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 default-router '172.16.0.1'
set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 lease '86400'
set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 name-server '1.1.1.1'
set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 range 0 start '172.16.0.200'
set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 range 0 stop '172.16.0.254'

set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 static-mapping unifi-gw-wan ip-address '172.16.0.2'
set service dhcp-server shared-network-name LAN2 subnet 172.16.0.0/24 static-mapping unifi-gw-wan mac-address '68:d7:9a:50:31:d1' # UDM-Pro WAN

# SERVERS network
set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 default-router '10.1.1.1'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 domain-name 'dan.sm'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 lease '86400'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 range 0 start '10.1.1.200'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 range 0 stop '10.1.1.254'

# Metal
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping ares ip-address '10.1.1.11'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping ares mac-address '70:0f:6a:38:ba:24' # Cisco UCS C240 M4
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping aurora ip-address '10.1.1.12'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping aurora mac-address 'ec:f4:bb:ce:75:44' # Dell PowerEdge R720
# K8s cluster (c0)
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-pi-0 ip-address '10.1.1.21'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-pi-0 mac-address 'dc:a6:32:e1:22:bc' # Raspberry Pi 4B 8GB
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-ares-0 ip-address '10.1.1.31'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-ares-0 mac-address '3e:11:b3:bb:5d:0d'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-ares-1 ip-address '10.1.1.32'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-ares-1 mac-address '3a:1f:69:51:27:39'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-ares-2 ip-address '10.1.1.33'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-ares-2 mac-address '9e:aa:2e:95:e9:e3'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-aurora-0 ip-address '10.1.1.34'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-aurora-0 mac-address 'c2:25:b9:a5:43:80'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-aurora-1 ip-address '10.1.1.35'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-aurora-1 mac-address 'ea:f7:34:25:a1:ba'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-aurora-2 ip-address '10.1.1.36'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping c0-aurora-2 mac-address '0a:44:7e:2f:7e:9a'

# TRUSTED network
set service dhcp-server shared-network-name TRUSTED authoritative
set service dhcp-server shared-network-name TRUSTED ping-check
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 default-router '10.1.2.1'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 domain-name 'dan.sm'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 lease '86400'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 range 0 start '10.1.2.200'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 range 0 stop '10.1.2.254'

set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping dan-macbook ip-address '10.1.2.2'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping dan-macbook mac-address 'f4:d4:88:6e:41:4f' # Dan's Laptop
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping dan-iphone ip-address '10.1.2.3'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping dan-iphone mac-address 'e2:3c:37:6e:3b:62' # Dan's iPhone
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping dan-eth-dongle ip-address '10.1.2.4'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping dan-eth-dongle mac-address '9c:53:22:3f:bd:4e' # TP-Link UE300

# IOT network
set service dhcp-server shared-network-name IOT authoritative
set service dhcp-server shared-network-name IOT ping-check
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 default-router '10.1.3.1'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 domain-name 'dan.sm'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 lease '86400'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 range 0 start '10.1.3.200'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 range 0 stop '10.1.3.254'

set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hue-bridge ip-address '10.1.3.5'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hue-bridge mac-address '00:17:88:78:2d:b1' # Philips Hue Bridge

# MANAGEMENT network
set service dhcp-server shared-network-name MANAGEMENT authoritative
set service dhcp-server shared-network-name MANAGEMENT ping-check
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 default-router '10.1.4.1'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 domain-name 'dan.sm'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 lease '86400'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 range 0 start '10.1.4.200'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 range 0 stop '10.1.4.254'

set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 static-mapping redetec-fss ip-address '10.1.4.5'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 static-mapping redetec-fss mac-address '00:0c:c8:05:19:6f' # Redetec PF/RED/3.0/IP
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 static-mapping ares-ipmi ip-address '10.1.4.11'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 static-mapping ares-ipmi mac-address '70:0f:6a:38:ba:1e' # Cisco UCS C240 M4 IMC
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 static-mapping aurora-ipmi ip-address '10.1.4.12'
set service dhcp-server shared-network-name MANAGEMENT subnet 10.1.4.0/24 static-mapping aurora-ipmi mac-address '18:fb:7b:9a:78:29' # Dell PowerEdge R720 iDRAC

# GUEST network
set service dhcp-server shared-network-name GUEST authoritative
set service dhcp-server shared-network-name GUEST ping-check
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 default-router '192.168.2.1'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 lease '86400'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 start '192.168.2.200'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 stop '192.168.2.254'
