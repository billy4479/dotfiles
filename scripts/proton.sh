#!/usr/bin/env zsh

proton-play() {
    # PROTON_USE_WINED3D11=1 \
    # PROTON_NO_D3D11=0 \
    # PROTON_NO_ESYNC=1 \
    DXVK_HUD=fps \
        STEAM_COMPAT_DATA_PATH="$HOME/Games/Proton" \
        $HOME/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/proton run "$1"
}
