#!/bin/vbash

# General
set firewall state-policy established action 'accept'
set firewall state-policy related action 'accept'
set firewall state-policy invalid action 'drop'

# Address groups
set firewall group address-group unifi_controller address '10.1.0.10'

set firewall group address-group k8s_api address '10.5.0.2'
set firewall group address-group k8s_ingress address '10.45.0.1'

# set firewall group address-group k8s_ingress_allowed address '10.1.3.x' # IoT

set firewall group address-group k8s_nodes address '10.1.1.31'
set firewall group address-group k8s_nodes address '10.1.1.32'
set firewall group address-group k8s_nodes address '10.1.1.33'
set firewall group address-group k8s_nodes address '10.1.1.34'
set firewall group address-group k8s_nodes address '10.1.1.35'
set firewall group address-group k8s_nodes address '10.1.1.36'

set firewall group address-group plex_clients address '10.1.3.3'

set firewall group address-group printers address '10.1.3.5'

# set firewall group address-group printer_allowed address '192.168.2.x' # Guest

set firewall group address-group vyos_bind address '10.5.0.3'
set firewall group address-group vyos_dnsdist address '10.5.0.4'

# Network groups
set firewall group network-group cloudflare-networks-ipv4 description 'Task Managed: Cloudflare IPv4 networks'
set firewall group network-group cloudflare-networks-ipv4 network '173.245.48.0/20'
set firewall group network-group cloudflare-networks-ipv4 network '103.21.244.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '103.22.200.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '103.31.4.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '141.101.64.0/18'
set firewall group network-group cloudflare-networks-ipv4 network '108.162.192.0/18'
set firewall group network-group cloudflare-networks-ipv4 network '190.93.240.0/20'
set firewall group network-group cloudflare-networks-ipv4 network '188.114.96.0/20'
set firewall group network-group cloudflare-networks-ipv4 network '197.234.240.0/22'
set firewall group network-group cloudflare-networks-ipv4 network '198.41.128.0/17'
set firewall group network-group cloudflare-networks-ipv4 network '162.158.0.0/15'
set firewall group network-group cloudflare-networks-ipv4 network '104.16.0.0/13'
set firewall group network-group cloudflare-networks-ipv4 network '104.24.0.0/14'
set firewall group network-group cloudflare-networks-ipv4 network '172.64.0.0/13'
set firewall group network-group cloudflare-networks-ipv4 network '131.0.72.0/22'

set firewall group network-group k8s_services network '10.45.0.0/16'

# Port groups
set firewall group port-group wireguard port '51820'
