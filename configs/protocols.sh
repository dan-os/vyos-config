#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.1.1.21 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.21 description 'c0-pi-0'
set protocols bgp neighbor 10.1.1.21 remote-as '64512'
set protocols bgp neighbor 10.1.1.31 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.31 description 'c0-ares-0'
set protocols bgp neighbor 10.1.1.31 remote-as '64512'
set protocols bgp neighbor 10.1.1.32 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.32 description 'c0-ares-1'
set protocols bgp neighbor 10.1.1.32 remote-as '64512'
set protocols bgp neighbor 10.1.1.33 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.33 description 'c0-ares-2'
set protocols bgp neighbor 10.1.1.33 remote-as '64512'
set protocols bgp neighbor 10.1.1.34 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.34 description 'c0-aurora-0'
set protocols bgp neighbor 10.1.1.34 remote-as '64512'
set protocols bgp neighbor 10.1.1.35 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.35 description 'c0-aurora-1'
set protocols bgp neighbor 10.1.1.35 remote-as '64512'
set protocols bgp neighbor 10.1.1.36 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.36 description 'c0-aurora-2'
set protocols bgp neighbor 10.1.1.36 remote-as '64512'

set protocols bgp parameters router-id '10.1.0.1'
set protocols bgp system-as '64512'
