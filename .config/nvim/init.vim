if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set nocompatible

set clipboard=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'joshdick/onedark.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sheerun/vim-polyglot'

call plug#end()
set encoding=utf-8

source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/nerdtree.vim

" Disable background color to allow trasparency in alacritty
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

