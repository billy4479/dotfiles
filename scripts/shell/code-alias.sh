#!/bin/sh

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
			git clone "git@github.com:billy4479/$1" && cd "$1" && codium .
		fi
	fi
}

alias license='license -name "Giacomo Ellero"'
