# If not interactive don't do anything
[[ $- != *i* ]] && return

# Enable colors
autoload -U colors && colors

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history

# Autocompletion
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# For 'word' delimiter
WORDCHARS=''

# End and start of the line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5H' beginning-of-line
bindkey '^[[1;5F' end-of-line

# Delete and backspace
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

# Ctrl+del, ctrl+bakspace
bindkey '^H' backward-kill-word
#bindkey '^?' backward-kill-word
bindkey '^[[3;5~' kill-word

# Ctrl+[Right/Left]-Arrow
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Arrow Up
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

# Arrow Down
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# automatically make it a tmux session
#if [ -n "$PS1" ] &&
#    [ -n "$DISPLAY" ] &&
#    [[ ! "$TERM" =~ screen ]] &&
#    [[ ! "$TERM" =~ tmux ]] &&
#    [ -z "$TMUX" ] &&
#    ! [ -e ~/storage/shared ] &&
#    command -v tmux 2>&1 1>/dev/null
#then
#        exec tmux
#fi

export GPG_TTY=$(tty)
setopt rmstarsilent

for script in `command ls ${HOME}/scripts/shell/*.sh`; do source "$script"; done
source ${HOME}/.config/zsh/all.zsh

# Theme
# source ${HOME}/.config/zsh/theme.zsh
eval "$(starship init zsh)"

afetch
