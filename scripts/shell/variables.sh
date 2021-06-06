#!/bin/sh

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export PAGER="bat"

export GOPATH="/home/billy/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin:/usr/lib/dart/bin:/opt/android-studio/bin:$HOME/Android/Sdk/platform-tools:/opt/aseprite:$HOME/Android/Sdk/emulator:$HOME/.local/bin:$HOME/flutter/bin:$HOME/.cargo/bin"
export code="/home/billy/code"
export JAVA_HOME="/usr/lib/jvm/default"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export EDITOR="nvim"
export servers='/mnt/SSDSata/Server Minecraft'
export AURDEST="/mnt/HDD/yay"
export CMAKE_GENERATOR=Ninja

# Flutter
#export CHROME_EXECUTABLE=`which chromium`

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

set +o noclobber
