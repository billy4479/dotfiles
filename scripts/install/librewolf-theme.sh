#!/bin/sh

set -e

profile_name=$(grep Default .librewolf/profiles.ini | grep release | awk -F= '{print $2}')
profile_path="$HOME/.librewolf/$profile_name"

echo "$profile_path"

pushd "${profile_path}"

ln -sf ../../src/Firefox-UI-Fix chrome
ln -sf ../../src/Firefox-UI-Fix/user.js .

popd

