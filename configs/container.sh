#!/bin/vbash

# Container networks
set container network services description 'Network for VyOS containers'
set container network services prefix '10.5.0.0/24'

# cloudflare-ddns
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.9.2'
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value 'ipv4.dan.sm'
set container name cloudflare-ddns environment IP6_PROVIDER value "none"
set container name cloudflare-ddns environment TZ value "${TIMEZONE}"
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns shared-memory '0'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns gid '1000'
set container name cloudflare-ddns uid '1000'

# haproxy
set container name haproxy image 'docker.io/library/haproxy:2.7.7'
set container name haproxy network services address '10.5.0.2'
set container name haproxy shared-memory '0'
set container name haproxy memory '0'
set container name haproxy restart 'on-failure'
set container name haproxy volume config source '/config/containers/haproxy/config/haproxy.cfg'
set container name haproxy volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name haproxy volume config mode 'ro'

# bind
set container name bind image 'docker.io/internetsystemsconsortium/bind9:9.19'
set container name bind command '/usr/sbin/named -4 -f -c /etc/bind/named.conf -u bind'
set container name bind cap-add 'net-bind-service'
set container name bind network services address '10.5.0.3'
set container name bind shared-memory '0'
set container name bind memory '0'
set container name bind restart 'on-failure'
set container name bind volume config source '/config/containers/bind/config'
set container name bind volume config destination '/etc/bind'
set container name bind volume config mode 'ro'
set container name bind volume cache source '/tmp/bind/cache'
set container name bind volume cache destination '/var/cache/bind'
set container name bind volume cache mode 'rw'

# dnsdist
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.0'
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist environment TZ value "${TIMEZONE}"
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist network services address '10.5.0.4'
set container name dnsdist shared-memory '0'
set container name dnsdist memory '0'
set container name dnsdist restart 'on-failure'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'

# udp-broadcast-relay-mdns
set container name udp-broadcast-relay-mdns image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-mdns environment CFG_DEV value 'eth1.20;eth1.40'
set container name udp-broadcast-relay-mdns environment CFG_ID value '2'
set container name udp-broadcast-relay-mdns environment CFG_MULTICAST value '224.0.0.251'
set container name udp-broadcast-relay-mdns environment CFG_PORT value '5353'
set container name udp-broadcast-relay-mdns environment SEPARATOR value ';'
set container name udp-broadcast-relay-mdns allow-host-networks
set container name udp-broadcast-relay-mdns cap-add 'net-raw'
set container name udp-broadcast-relay-mdns shared-memory '0'
set container name udp-broadcast-relay-mdns memory '0'
set container name udp-broadcast-relay-mdns restart 'on-failure'
