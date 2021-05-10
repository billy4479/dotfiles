#! /bin/bash 
lxsession &
picom --experimental-backends --xrender-sync-fence &
nitrogen --restore &
redshift &
# volumeicon &
nm-applet &
# pasystray &
xfce4-clipman &
numlockx &
playerctld daemon &
#kitty -e "zsh -c 'connect-random-vpn it tcp'"
