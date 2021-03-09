#!/usr/bin/env zsh
connect-random-vpn(){
        sudo openvpn --config "`command ls /media/billy/SSDSata/NordVPN\ Servers/$1*$2.ovpn | sort -R | tail -1`" --auth-user-pass /media/billy/SSDSata/NordVPN\ Servers/creds.txt
}
