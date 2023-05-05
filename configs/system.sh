#!/bin/vbash

# Domain
set system domain-name 'dan.sm'
set system host-name 'gateway'

set system ipv6 disable-forwarding

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

# SSH
set system login user vyos authentication public-keys dan-macbook key 'AAAAC3NzaC1lZDI1NTE5AAAAIDxJWUR/LYvaS7H2fVp/UX/xPo4JLdQRxSBkH3wZ4Bcl'
set system login user vyos authentication public-keys dan-macbook type 'ssh-ed25519'

# Logging
delete system syslog global facility all level
set system syslog global facility all level 'info'
delete system syslog global facility protocols level
set system syslog global facility protocols level 'debug'

# CRON jobs
set system task-scheduler task task-cloudflare-networks executable path '/config/scripts/task-cloudflare-networks.sh'
set system task-scheduler task task-cloudflare-networks interval '6h'

# Timezone
set system time-zone "${TIMEZONE}"
