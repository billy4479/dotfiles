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
alias vi="vim"
alias vim="nvim"
alias hey="cls && neofetch"

alias ls="exa --icons --color=auto --group-directories-first"
#alias ls="logo-ls -Ah"
alias ll="ls -lah"
alias la="ls -a"
alias std-ls="/bin/ls --color=auto"

alias grep="grep --color=auto"

alias clipcopy="tee /dev/stderr | xclip -in -selection clipboard"
alias a="tmux attach -t main"
alias o="xdg-open"

alias java8="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"

mkcd() { mkdir -p "$1" && cd "$1"; }

#unalias c
alias t="tmux attach"
alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ip='ip --color=auto'
