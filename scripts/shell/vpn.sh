#!/bin/sh

connect-random-vpn() {
        sudo openvpn --config "$(command ls $VPN_SERVERS/$1*$2.ovpn | sort -R | tail -1)" --auth-user-pass "$VPN_SERVERS/creds.txt"
}
