#!/bin/vbash

# # Gateway
# set system static-host-mapping host-name gateway.dan.sm inet 10.1.0.1
# set system static-host-mapping host-name gateway.dan.sm alias vpn.dan.sm
# set system static-host-mapping host-name gateway.dan.sm alias ipv4.dan.sm

# # Unifi
# set system static-host-mapping host-name unifi.dan.sm inet 10.1.0.10

# # Proxmox hosts
# set system static-host-mapping host-name aurora.dan.sm inet 10.1.1.11
# set system static-host-mapping host-name ares.dan.sm inet 10.1.1.12

# # Kubernetes cluster hosts
# set system static-host-mapping host-name c0-ares-0.dan.sm inet 10.1.1.31
# set system static-host-mapping host-name c0-ares-1.dan.sm inet 10.1.1.32
# set system static-host-mapping host-name c0-ares-2.dan.sm inet 10.1.1.33
# set system static-host-mapping host-name c0-aurora-0.dan.sm inet 10.1.1.34
# set system static-host-mapping host-name c0-aurora-1.dan.sm inet 10.1.1.35
# set system static-host-mapping host-name c0-aurora-2.dan.sm inet 10.1.1.36

# # Kubernetes cluster VIP
# set system static-host-mapping host-name c0.dan.sm inet 10.5.0.2

# # Other hosts
# # -- todo --
