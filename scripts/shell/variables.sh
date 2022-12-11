#!/bin/sh

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export PNPM_HOME="/home/billy/.local/share/pnpm"
export CARGO_HOME="$HOME/.local/share/cargo"
export JAVA_HOME="/usr/lib/jvm/default"
export GOPATH="/home/billy/go"
export npm_config_prefix="$HOME/.local"

export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin:/usr/lib/dart/bin:/opt/android-studio/bin:$HOME/Android/Sdk/platform-tools:/opt/aseprite:$HOME/Android/Sdk/emulator:$HOME/.local/bin:$HOME/flutter/bin:$CARGO_HOME/bin:$HOME/.emacs.d/bin:$HOME/Games/bin:$PNPM_HOME"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
#export CC=clang
#export CXX=clang++

# Pager for Git - Disabled since it messes up with delta
# export PAGER="bat"

export EDITOR="nvim"
export DIFFPROG="nvim -d"

# App to open man pages (bat in this case)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Disable confirmation for `rm *`
set +o noclobber

# **Script Variables**

# Code/dev folder
export code="$HOME/code"

# Minecraft servers folder
export servers='/mnt/SSDSata/Server Minecraft'

export VPN_SERVERS="$HOME/NordVPN Servers"

# Yay package cache
# export AURDEST="/mnt/HDD/yay"

# CMake generator - disable since it messes up some projects, use -G
# export CMAKE_GENERATOR=Ninja

eval "$(antidot init)"
