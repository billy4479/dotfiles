#!/usr/bin/env zsh
connect-random-vpn(){
        sudo openvpn --config `command ls /etc/openvpn/NordVPN/$1*$2.ovpn | sort -R | tail -1` --auth-user-pass /etc/openvpn/NordVPN/creds.txt
}
