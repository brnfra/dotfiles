"====================================================================
" Arquivo: vimwiki.vim
" Autor: Bruno Franco
" Download: git@github.com:brnfra
" Licence:Este arquivo é de domínio público
" Garantia: O autor não se responsabiliza por eventuais danos
"           causados pelo uso deste arquivo.
"
" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"  _\ V /  | || |  | |  _ <| |___
" (_)\_/  |___|_|  |_|_| \_\\____|
"
"====================================================================
"              VIMWIKI {{{
let g:wiki = {}
let g:wiki.path = '~/vimwiki'
let g:wiki.syntax = 'default'
let g:wiki.ext = '.wiki'
"let g:vimwiki_listsyms: '✗○◐●✓'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'listsyms': '✗○◐●✓'}]

set runtimepath+=~/vimwiki
set runtimepath+=~/vimwiki/ultisnips
set runtimepath+=~/vimwiki/vim-snippets

"""----------------------------------------------------------------
"inoremap <C-z> <Plug>VimwikiDecreaseLvlSingleItem
""inoremap <C-x> <Plug>VimwikiIncreaseLvlSingleItem
"Esc conflict"
"inoremap <C-]> <Plug>VimwikiTablePrevCell
"inoremap <C-[> <Plug>VimwikiTableNextCell
""nnoremap <C-]> <Plug>VimwikiTablePrevCell
"nnoremap <C-Tab> <Plug>VimwikiPrevLink
"nnoremap <C-n> <Plug>VimwikiDiaryNextDay
"nnoremap <C-m> <Plug>VimwikiDiaryPrevDay
""nnoremap <C-[> <Plug>VimwikiTableNextCell
"              }}}
