#!/usr/bin/env bash

function cdc(){
	cd $code
	if [ "$1" != "" ]; then
		cd "$1"
       	fi
}

function c() {
    if [ "$1" = "" ]; then
        code .
        return
    fi

    if [ -d "$code/$1" ]; then
        cd $code/$1
        code .
    else
        echo -n "Directory not found! Try on github? (y/N) "
        read answer
        if [ "$answer" = "y" ]; then
            cd $code
            git clone billy4479/$1 && cd $1 && code .
        fi
    fi
}

function goinit-nogit() {
    if [ "$1" != "" ]; then
        mkdir -p $1
        cd $1
    fi
    go mod init github.com/billy4479/$(basename $(pwd))
}

function goinit() {
    goinit-nogit $1
    git init
}

