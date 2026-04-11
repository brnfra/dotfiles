"====================================================================
" Arquivo: nerdtree.vim
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
"              NERDTree configuration      
""------------------------------------------------------
"p  -   parent directory
"s  -   vertical split
"i  -   horizontal split
"u  -   up on folder tree
"t  -   open file in new tab
"r  -   refresh tree
"q  -   quit nerdtree
"z  -   z+[direction] move screen on nerdtree
"x  -   close tree root
"m  -   menu
""if !has('nvim')
""autocmd StdinReadPre * let s:std_in=1
"Auto Enter
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |   endif
""endif
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeTooggle = 1
set fillchars+=vert:\█ 
let g:NERDTreeWinSize = 40
"Disable arrows
let g:NERDTreeDirArrowExpandable = "\u21B3"
let g:NERDTreeDirArrowCollapsible = "\u21B6"
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeMapUpdir = '<left>'
let g:NERDTreeMapActivateNode = '<right>'
let g:NERDTreeMapOpenSplit= '-'
let g:NERDTreeMapOpenVSplit= '+'
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <esc>:NERDTreeToggle<CR>i
vnoremap <F2> <esc>:NERDTreeToggle<CR>
