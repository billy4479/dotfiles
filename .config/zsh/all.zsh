#!/usr/bin/env zsh

# Plugin dir
pd=${HOME}/.config/zsh/plugins

source ${pd}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${pd}/history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

source ${pd}/fzf.zsh

# Oh-My-Zsh git integration (maily for themes)
source ${pd}/git.zsh
