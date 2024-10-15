set nocompatible
set number
syntax on
set expandtab
set shiftwidth=4
set softtabstop=4
autocmd BufWritePre * :%s/\s\+$//e
let skip_defaults_vim = 1
let g:netrw_dirhistmax = 0
set viminfo=""
