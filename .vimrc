set nocompatible
set number
syntax on

autocmd BufWritePre * :%s/\s\+$//e
let skip_defaults_vim=1
set viminfo=""
