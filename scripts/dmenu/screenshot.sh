#!/bin/sh

sel="Selection"
full="Fullscreen"
win="Window"

screenshot() {
	read mode

	local save_path="$HOME/Pictures/Screenshots"
	mkdir -p "$save_path"

	local name="$(date +%Y-%m-%d\ %H:%M:%S).png"
	local path="$save_path/$name"

	case "$mode" in
	$sel)
		maim -u -s | tee "$path" | xclip -selection clipboard -t image/png
		;;

	$full)
		maim -t 1 | tee "$path" | xclip -selection clipboard -t image/png
		;;

	$win)
		maim -u -i $(xdotool getactivewindow) | tee "$path" | xclip -selection clipboard -t image/png
		;;
	esac
}

echo -e "$sel\n$full\n$win" | rofi -dmenu | screenshot
