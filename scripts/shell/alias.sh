#!/bin/sh

alias rb="echo 'Reloading shell...' && source $ZDOTDIR/.zshrc"

session-type() {
	loginctl show-session $(loginctl | grep $USER | awk '{print $1}') -p Type | awk -F= '{print $2}'
}

rs() {
	echo "Reloading scripts"
	for script in $(command ls ${HOME}/scripts/shell/*.sh); do
		source "$script"
	done
}

cds() {
	cd "$servers"
	if [ "$1" != "" ]; then
		cd "$1"
	fi
}

# kill all tmux sessions with no terminal emulator attached
tmkill() {
	LIST="$(tmux ls)"
	TSESSIONS=""
	while read -r line; do
		if ! echo "$line" | grep 'attached'; then
			tmux kill-session -t "$(echo $line | grep -oP '^\d\d?')"
		fi
	done <<<"$LIST"
}

alias cls="clear"
alias pg="ping 8.8.8.8"
alias vi="nvim"
alias vim="nvim"
alias hx="helix"
alias o="xdg-open"
alias se='sudoedit'

alias a="tmux attach"
alias t="tmux attach -t main"
alias ssh="TERM=xterm ssh"
alias gotop="gotop --nvidia"

alias ls="exa -a --icons --color=auto --group-directories-first"
#alias ls="logo-ls -Ah"
alias ll="ls -lh"
alias std-ls="command ls --color=auto"

alias grep="grep --color=auto"
alias ip='ip --color=auto'

alias clipcopy="tee /dev/stderr | xclip -in -selection clipboard"
alias clippaste="xclip -out -selection clipboard"

mkcd() { mkdir -p "$1" && cd "$1"; }

alias sus="systemctl suspend"

alias ffprobe="ffprobe -hide_banner"
alias ffmpeg="ffmpeg -hide_banner"
