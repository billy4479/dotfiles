#!/bin/sh

alias rb="echo 'Reloading shell...' && source $ZDOTDIR/.zshrc"

rs() {
        echo "Reloading scripts"
        for script in $(ls ${HOME}/scripts/*.sh); do
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
# No idea why is vim complaining about this `

alias cls="clear"
alias pg="ping 8.8.8.8"
alias vi="nvim"
alias vim="nvim"
alias o="xdg-open"

alias a="tmux attach"
alias t="tmux attach -t main"
alias ssh="TERM=xterm ssh"
alias gotop="gotop --nvidia"

alias ls="exa --icons --color=auto --group-directories-first"
#alias ls="logo-ls -Ah"
alias ll="ls -lah"
alias la="ls -a"
alias std-ls="/bin/ls --color=auto"

alias grep="grep --color=auto"
alias ip='ip --color=auto'

alias clipcopy="tee /dev/stderr | xclip -in -selection clipboard"
alias clippaste="xclip -out -selectioin clipboard"

alias java8="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"
alias java11="/usr/lib/jvm/java-11-openjdk-amd64/jre/bin/java"

mkcd() { mkdir -p "$1" && cd "$1"; }

alias vpn='nordvpn-server-picker -config $VPN_SERVERS -creds $VPN_SERVERS/creds.txt'
