# dotfiles

A collection of my configuration files

### How to install

```bash
git clone --bare git@github.com:billy4479/dotfiles.git dotfiles
alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config checkout
config submodule update --init --recursive
```
