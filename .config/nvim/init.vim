set termguicolors
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'

call plug#end()
set encoding=utf-8

source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/fzf.vim

