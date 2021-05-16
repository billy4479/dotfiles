#!/bin/sh 
mount /mnt/NAS &
lxsession &
picom --experimental-backends --xrender-sync-fence &
nitrogen --restore &
redshift &
nm-applet &
xfce4-clipman &
numlockx &
playerctld daemon &
dunst &

