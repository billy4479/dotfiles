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

call plug#end()

" Theme
colorscheme onedark
let g:airline_theme = 'onedark'

"colorscheme material
"let g:material_theme_style = 'darker-community'
"let g:airline_theme = 'material'

" Colorizer
lua require'colorizer'.setup()

syntax on
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set number relativenumber

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
