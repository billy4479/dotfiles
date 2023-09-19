#!/bin/sh

export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"

export PNPM_HOME="${XDG_DATA_HOME}/pnpm"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export JAVA_HOME="/usr/lib/jvm/default"
export GOPATH="${XDG_DATA_HOME}/go"
export npm_config_prefix="$HOME/.local"

export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$HOME/Games/bin:$PNPM_HOME:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export GOPROXY="direct"

export GPG_TTY=$(tty)

# CMake generator
export CMAKE_GENERATOR=Ninja

#export CC=clang
#export CXX=clang++

export SYSTEMD_PAGER="bat"

export EDITOR="nvim"
export DIFFPROG="nvim -d"

# App to open man pages (bat in this case) - Just using `batman` now
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Disable confirmation for `rm *`
set +o noclobber

# **Script Variables**

# Code/dev folder
export code="$HOME/code"

# Minecraft servers folder
export servers="$HOME/Games/Server Minecraft"

# Let's try without for a while
# eval "$(antidot init)"

if [ ! -z "$HISTFILE" ]; then
  HISTDIR=${HISTFILE%/*}
  mkdir -p "$HISTDIR"
fi

if [ ! -z "$CONTAINER_ID" ]; then
  # We are inside distrobox
  export LANG="en_CA.UTF-8"
fi

