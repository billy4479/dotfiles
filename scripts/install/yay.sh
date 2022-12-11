#!/bin/sh
set -e

pushd ~/src/yay
makepkg -si
popd
