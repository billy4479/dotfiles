#!/bin/sh

# alias git="PAGER=less git"
alias gaa='git add -A'
alias gap='git add --patch'
alias ga='git add'
alias gps='git push origin `git branch --show-current`'
alias gpl='git pull origin `git branch --show-current` --recurse'
alias gd='git diff'
alias gc='git commit'
alias gs='git status'
alias gl='git log'
alias gcl='git clone --recursive'

alias config="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias conf="config"
alias confa="config add"
alias confd="config diff"
alias confc="config commit"
alias confu="config add -u --patch"
