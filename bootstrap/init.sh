#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

load /opt/vyatta/etc/config.boot.default

# Generate key for GitHub
ssh-keygen -t ed25519 -C "vyos@dan.sm" -f /config/secrets/id_ed25519

# Generate age key
age-keygen -o /config/secrets/vyos.agekey
