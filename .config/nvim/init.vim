set runtimepath^=~/.vim/runtimepath runtimepath+=~/.vim/runtimepath/after
let &packpath = &runtimepath
" Carrega tema
colorscheme habamax

" Aplica seus highlights depois do tema
autocmd VimEnter * highlight ErrorMsg guifg=DarkRed guibg=White
autocmd VimEnter * highlight WarningMsg guifg=DarkOrange guibg=White

source ~/.vimrc
let g:python3_host_prog = '/usr/bin/python3'
