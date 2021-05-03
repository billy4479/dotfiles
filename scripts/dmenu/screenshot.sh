#!/bin/sh

screnshot() {
    read mode

    case "$mode" in

    "Selection to Clip")
        maim -s | xclip -selection clipboard -t image/png
        ;;

    "Fullscreen to Clip")
        maim -t 1 | xclip -selection clipboard -t image/png
        ;;

    "Window to Clip")
        maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
        ;;

    "Selection to File")
        maim -s "/home/billy/Pictures/Screenshots/$(date +%Y-%m-%d\ %X).png"
        ;;

    "Fullscreen To File")
        maim "/home/billy/Pictures/Screenshots/$(date +%Y-%m-%d\ %X).png"
        ;;

    "Window to File")
        maim -i $(xdotool getactivewindow) "/home/billy/Pictures/Screenshots/$(date +%Y-%m-%d\ %X).png"
        ;;
    esac
}

echo -n "\
Selection to Clip
Fullscreen to Clip
Window to Clip
Selection to File
Fullscreen To File
Window to File
" | dmenu -h 20 | screnshot
