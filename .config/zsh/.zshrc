# If not interactive don't do anything
[[ $- != *i* ]] && return

# Enable colors
autoload -U colors && colors

HISTSIZE=10000000
SAVEHIST=$HISTSIZE

# Thanks to https://github.com/bttger/my-zsh/blob/main/.zshrc

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

# https://unix.stackexchange.com/a/273863

setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

mkdir -p ~/.cache/zsh
HISTFILE="~/.cache/zsh/history"


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

bindkey "^[[H" beginning-of-line # HOME
bindkey "^[[F" end-of-line # END
bindkey "^[[3~" delete-char # DEL
bindkey "^[[3;5~" delete-word # CTRL+DEL - delete a whole word after cursor
bindkey "^H" backward-delete-word # CTRL+BACKSPACE - delete a whole word before cursor
bindkey "^[[1;5C" forward-word # CTRL+ARROW_RIGHT - move cursor forward one word
bindkey "^[[1;5D" backward-word # CTRL+ARROW_LEFT - move cursor backward one word
bindkey "^Z" undo # CTRL+Z
bindkey "^Y" redo # CTRL+Y

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
