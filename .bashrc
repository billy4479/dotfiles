for script in `command ls ${HOME}/scripts/shell/*.sh`; do source "$script"; done

eval "$(antidot init)"