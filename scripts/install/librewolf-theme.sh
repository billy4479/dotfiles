#!/bin/sh

set -e

profile_name=$(grep Default .librewolf/profiles.ini | awk -F= '{print $2}')
profile_path="$HOME/.librewolf/$profile_name"

download_url=$(curl -Ss "https://api.github.com/repos/black7375/Firefox-UI-Fix/releases/latest" | jq -r '.assets[].browser_download_url' | grep Lepton.zip)
temp_zip=$(mktemp --tmpdir XXXXXXXXXX.zip)
temp_ext_dir=$(mktemp --tmpdir -d)

wget "$download_url" -O "$temp_zip"
unzip "$temp_zip" -d "$temp_ext_dir"

mv "$temp_ext_dir/chrome" "$profile_path"
mv "$temp_ext_dir/user.js" "$profile_path"
