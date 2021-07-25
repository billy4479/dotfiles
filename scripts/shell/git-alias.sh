#!/bin/sh

alias git="PAGER=less git"
alias gaa="git add -A"
alias gas="git add --patch"
alias gps="git push origin master"
alias gpl="git pull origin master --recurse"
alias gd="git diff"
alias gc="git commit"

alias config="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias conf="config"
alias caa="config add -u --patch"
alias cdf="config diff"
alias ccm="config commit"

