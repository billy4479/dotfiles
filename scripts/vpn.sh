#!/bin/sh
connect-random-vpn() {
        sudo openvpn --config "$(command ls /mnt/SSDSata/NordVPN\ Servers/$1*$2.ovpn | sort -R | tail -1)" --auth-user-pass /mnt/SSDSata/NordVPN\ Servers/creds.txt
}
