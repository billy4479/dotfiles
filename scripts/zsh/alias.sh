#!/usr/bin/env zsh

alias rb="echo 'Reloading zsh...' && source $HOME/.zshrc"

rs() {
	echo "Reloading scripts"
	for script in `ls ${HOME}/scripts/*.sh`; do
	       	source "$script"
	done
}

cds(){
        cd "/media/billy/SSDSata/Server Minecraft"
        if [ "$1" != "" ]; then
                cd "$1"
        fi
}

alias cls="clear"
alias pg="ping 8.8.8.8"
alias vi="vim"
alias vim="nvim"
alias hey="cls && neofetch"

unalias ll
unalias la
alias ls="exa --color=auto --group-directories-first -l"
alias ll="ls -a"
alias la=ll
alias std-ls="/bin/ls --color=auto"

alias clipcopy="tee /dev/stderr | xclip -in -selection clipboard"
alias a="tmux attach -t main"

alias java8="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"

function mkcd(){ mkdir -p "$1" && cd "$1";}

#unalias c
alias t="tmux new-session -A -s main"
alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
