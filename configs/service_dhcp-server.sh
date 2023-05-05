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

set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping unifi-controller ip-address '10.1.0.10'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping unifi-controller mac-address '68:d7:9a:50:31:c9' # UDM-Pro
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

# SERVERS network
set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 default-router '10.1.1.1'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 domain-name 'dan.sm'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 lease '86400'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 range 0 start '10.1.1.200'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 range 0 stop '10.1.1.254'

set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping aurora ip-address '10.1.1.31'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping aurora mac-address 'ec:f4:bb:ce:75:44' # Dell PowerEdge R720
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping ares ip-address '10.1.1.32'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping ares mac-address '70:0f:6a:38:ba:24' # Cisco UCS C240 M4

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

# IOT network
set service dhcp-server shared-network-name IOT authoritative
set service dhcp-server shared-network-name IOT ping-check
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 default-router '10.1.3.1'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 domain-name 'dan.sm'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 lease '86400'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 range 0 start '10.1.3.200'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 range 0 stop '10.1.3.254'

# GUEST network
set service dhcp-server shared-network-name GUEST authoritative
set service dhcp-server shared-network-name GUEST ping-check
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 default-router '192.168.2.1'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 lease '86400'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 start '192.168.2.200'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 stop '192.168.2.254'
