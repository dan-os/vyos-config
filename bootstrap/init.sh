#!/bin/vbash

# # Generate key for GitHub
# ssh-keygen -t ed25519 -C "vyos@dan.sm" -f /config/secrets/id_ed25519

# # Generate age key
# age-keygen -o /config/secrets/vyos.agekey

source /opt/vyatta/etc/functions/script-template

load /opt/vyatta/etc/config.boot.default

# Interfaces
set interfaces ethernet eth0 description 'WAN'
set interfaces ethernet eth0 hw-id 'ec:f4:bb:ce:75:45'
set interfaces ethernet eth0 address 'dhcp'

set interfaces ethernet eth1 description 'LAN'
set interfaces ethernet eth1 hw-id 'ec:f4:bb:ce:75:46'

set system name-server '1.1.1.1'

# SSH
set service ssh port '22'
set system login user vyos authentication public-keys dan-macbook key 'AAAAC3NzaC1lZDI1NTE5AAAAIDxJWUR/LYvaS7H2fVp/UX/xPo4JLdQRxSBkH3wZ4Bcl'
set system login user vyos authentication public-keys dan-macbook type 'ssh-ed25519'

commit
save
