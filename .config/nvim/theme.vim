" Theme

"colorscheme onedark
"let g:airline_theme = 'onedark'

"colorscheme material
"let g:material_theme_style = 'palenight'
"let g:airline_theme = 'material'

colorscheme catppuccin_frappe
let g:lightline = {'colorscheme': 'catppuccin_frappe'}

" Colorizer
lua require'colorizer'.setup()

syntax on
set number relativenumber
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set encoding=utf-8

