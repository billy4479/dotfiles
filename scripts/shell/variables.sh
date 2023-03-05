#!/bin/sh

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export PNPM_HOME="$HOME/.local/share/pnpm"
export CARGO_HOME="$HOME/.local/share/cargo"
export JAVA_HOME="/usr/lib/jvm/default"
export GOPATH="$HOME/go"
export npm_config_prefix="$HOME/.local"

export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$HOME/Games/bin:$PNPM_HOME:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export GOPROXY="direct"
#export CC=clang
#export CXX=clang++

# Pager for Git - Disabled since it messes up with delta
# export PAGER="bat"

export EDITOR="helix"
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

HISTDIR=${HISTFILE%/*}
mkdir -p "$HISTDIR"
