#!/usr/bin/env bash

alias git="hub"
alias gaa="git add ."
alias gcp="gc && gps"
alias gps="git push origin master"
alias gpl="git pull origin master --recurse"

function gc() { #Not quite working
    if [ "$1" -ne "" ]; then
        git commit -m $1
    else
        git commit
    fi
}


