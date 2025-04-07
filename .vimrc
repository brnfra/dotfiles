"====================================================================
" Arquivo: .vimrc
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
"                  System Config {{{
"-------------------------------------------------------
source ~/.vim/configs/plugins.vim
source ~/.vim/configs/mappings.vim
source ~/.vim/configs/settings.vim
" automate instalation junegunn vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl --insecure -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"------------------------------------End System config}}}"
"                  AUTOCMD RULES {{{
"-------------------------------------------------------
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
" ------------------------------------------------------------------------------------------------------------------------------
" History saving
" ------------------------------------------------------------------------------------------------------------------------------
set history=100
augroup user_persistent_undo
    autocmd!
    au BufWritePre /tmp/*          setlocal noundofile
    au BufWritePre COMMIT_EDITMSG  setlocal noundofile
    au BufWritePre MERGE_MSG       setlocal noundofile
    au BufWritePre *.tmp           setlocal noundofile
    au BufWritePre *.bak           setlocal noundofile
augroup END

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END
"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
"" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END
" Set header vim files{{{{
augroup auto_header
    autocmd!
    autocmd BufWritePre * silent! execute "normal ma"
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Arquivo\:.*/s//Arquivo\:"expand("%:t")
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Autor\:.*/s//Autor\: Bruno Franco"
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Ultima_modificacao\:.*/s//Ultima_modificacao\: ".strftime("%d-%m-%Y")
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Download\:.*/s//Download\: git\@github\.com\:brnfra"
    autocmd BufWritePost,FileWritePost * silent! execute "normal `a"
augroup END
" }}}}
" NERD Commenter {{{
augroup nerd_commenter
    autocmd!
    let NERDSpaceDelims=1
    let NERDCompactSexyComs=1
    let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
" }}}
"       EasyAlign.vim {{{
augroup easy_align_config
    autocmd!
    vnoremap <Enter> <Plug>(EasyAlign) 
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    xnoremap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nnoremap <Leader>a <Plug>(EasyAlign) 
augroup END

" }}}
"autocmd vimenter * NERDTree  {{{
if !has('nvim')
    autocmd VimEnter * exec ":loadview"
endif
"}}}
"-------------------------------------------------------
"" Custom configs
"-------------------------------------------------------
" c
autocmd FileType c setlocal ts=4 noet shiftwidth=4 expandtab
autocmd FileType cpp setlocal ts=4 noet shiftwidth=4 expandtab
" javascript
let g:javascript_enable_domhtmlcss = 1
" vim-javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript setl ts=4 noet|setl shiftwidth=4|setl expandtab 
augroup END

" Arquivos .sh sao sempre bash, e não sh
"au FileType sh let b:is_bash=1
"-------------------------------------------END AUTCMD }}}
"                   SYNTAX Stuffs       {{{
"-------------------------------------------------------
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
" C/C++ specific settings
au FileType c,cpp,cc set cindent
" Java specific settings
au BufNewFile,BufRead *.java set ft=java
" Associate uncommon filetypes
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile .rspec set filetype=eruby
au BufRead,BufNewFile *.workflow set filetype=hcl
au BufRead,BufNewFile *.acl set filetype=vcl
au BufRead,BufNewFile vifminfo,vifmrc set filetype=vim
au BufRead,BufNewFile *.wiki,*.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown
au BufRead,BufNewFile txt set filetype=text
au BufRead,BufNewFile config set filetype=bash
au BufRead,BufNewFile aliases set filetype=bash
au BufRead,BufNewFile exports set filetype=bash
au BufRead,BufNewFile input set filetype=bash
au BufRead,BufNewFile profiles set filetype=bash
au BufRead,BufNewFile prompt set filetype=bash
au BufRead,BufNewFile ssh_config set filetype=bash
au BufRead,BufNewFile git_config set filetype=bash
au BufRead,BufNewFile config set filetype=bash
au BufRead,BufNewFile sh set filetype=bash
au BufRead,BufNewFile .git* set filetype=git
au BufRead,BufNewFile 'ASCII text' set filetype=bash
"---------------------------------------------
" file type detection
"---------------------------------------------
" highlight action script and mxml syntax
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.less set filetype=less
"au BufWritePre * :%s/\s\+$//e        " remove trailing whitespace
"---------------------------------------------
" Enable omni completion. (Ctrl-X Ctrl-O)
"---------------------------------------------
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" use syntax complete if nothing else available
" autocmd FileType html,php,markdown,css,c,java,javascript,js,xml,phyton set foldmethod=indent
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
		\ if &omnifunc == "" |
		\   setlocal omnifunc=syntaxcomplete#Complete |
		\ endif
endif
"---------------------------------------------
" for PHP programming
"---------------------------------------------
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
"---------------------------------------------
" for edit CSS
"---------------------------------------------
autocmd FileType css setlocal expandtab shiftwidth=4 ts=4 noet 
" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss			set ft=scss.css
autocmd BufNewFile,BufRead *.sass			set ft=sass.css
"---------------------------------------------
" for edit HTML
"---------------------------------------------
autocmd FileType html,xhtml setlocal expandtab shiftwidth=4 ts=4 noet 
"---------------------------------------------------------------------------

"-------------------------------------------END SYNTAX }}}
