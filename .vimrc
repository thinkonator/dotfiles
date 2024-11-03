set nocompatible

call plug#begin()
Plug 'morhetz/gruvbox'
call plug#end()
syntax on
set background=dark
let g:gruvbox_contrast_dark = "hard"
autocmd vimenter * ++nested colorscheme gruvbox

set tgc
set number
set hlsearch
set expandtab
set shiftwidth=4
set softtabstop=4
autocmd BufWritePre * :%s/\s\+$//e
set viminfo=""
let g:netrw_dirhistmax = 0
let skip_defaults_vim = 1
