#!/bin/sh

show-colors(){
reset=`tput sgr0`

printf "\
bg:      `tput setab 0`#282c34 $reset
fg:      `tput setab 7``tput setaf 0`#abb2bf $reset
red:     `tput setab 1`#e06c75 $reset
magenta: `tput setab 5`#c678dd $reset
blue:    `tput setab 4`#61afef $reset
green:   `tput setab 2`#98c379 $reset
yellow:  `tput setab 3`#e5c07b $reset
cyan:    `tput setab 6`#56b6c2 $reset

black:   #212121
white:   #efffff
"
}

