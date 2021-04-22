#!/bin/sh

export GOPATH="/home/billy/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin:/usr/lib/dart/bin:/opt/android-studio/bin:$HOME/Android/Sdk/platform-tools:/opt/aseprite:$HOME/Android/Sdk/emulator:$HOME/.local/bin:$HOME/flutter/bin:$HOME/.cargo/bin"
export code="/home/billy/code"
export JAVA_HOME="/usr/lib/jvm/default"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export EDITOR="nvim"
export servers='/mnt/SSDSata/Server Minecraft'
export AURDEST="/mnt/HDD/yay"

# Flutter
#export CHROME_EXECUTABLE=`which chromium`

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

set +o noclobber
