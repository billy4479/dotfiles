#!/usr/bin/env zsh

cdc() {
    cd $code
    if [ "$1" != "" ]; then
        cd "$1"
    fi
}

c() {
    if [ -z ${1+x} ]; then
        codium .
        return
    fi

    if [ -d "$code/$1" ]; then
        cd $code/$1
        codium .
    else
        echo -n "Directory not found! Try on github? (y/N) "
        read answer
        if [ "$answer" = "y" ]; then
            cd $code
            git clone billy4479/$1 && cd $1 && codium .
        fi
    fi
}

goinit-nogit() {
    if [ "$1" != "" ]; then
        mkdir -p $1
        cd $1
    fi
    go mod init github.com/billy4479/$(basename $(pwd))
}

goinit() {
    goinit-nogit $1
    git init
}
