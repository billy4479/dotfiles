#!/bin/sh

# alias git="hub"
alias gaa="git add ."
alias gps="git push origin master"
alias gpl="git pull origin master --recurse"

function gc() {
    if [ -z ${1+x} ]; then
        git commit
    else
        git commit -m $1
    fi
}
