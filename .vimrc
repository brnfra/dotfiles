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
"set nocompatible    " be iMproved, required
set shell=$SHELL\ -f
set path+=**
set exrc
scriptencoding utf-8
set secure
set t_Co=256
" --- sane text files -------   Encoding ----"
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,latin1   
set ttyfast
if !has('nvim')
    set ttymouse=xterm2
endif
""set magic
"" automate instalation junegunn vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl --insecure -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"------------------------------------End System config}}}"
"                   Global Stuff  {{{
"-------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------------------------
" Vim Directories
" ------------------------------------------------------------------------------------------------------------------------------
" Persistent Undoo
set undofile 
if !has('nvim')
    set viminfo=<500,:100,/50,%,'50,h,f0,s512
    set viminfo+=n~/.vim/.viminfo
else
    set viminfo+=n~/.vim/.shada
endif
let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~').'/.vim') 
set nobackup                                                             
set noswapfile                                                          
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp           
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp      
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp      
set viewdir=$DATA_PATH/view/                                       
set viewoptions=folds,cursor,curdir,slash,unix                    
" Local directories 
set backupdir=~/.vim/backups/
set directory=~/.vim/backups/swaps/
set undodir=~/.vim/backups/undo/

" ------------------------------------------------------------------------------------------------------------------------------
" History saving
" ------------------------------------------------------------------------------------------------------------------------------
set history=2000
augroup user_persistent_undo
    autocmd!
    au BufWritePre /tmp/*          setlocal noundofile
    au BufWritePre COMMIT_EDITMSG  setlocal noundofile
    au BufWritePre MERGE_MSG       setlocal noundofile
    au BufWritePre *.tmp           setlocal noundofile
    au BufWritePre *.bak           setlocal noundofile
augroup END

" ------------------------------------------------------------------------------------------------------------------------------
set termguicolors
set mouse=a " Enable mouse in all modes
set cursorcolumn
set cursorline
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
" ignore these files while expanding wild chars
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg,*pdf
set wildignore+=*.swp,*.bak,*.pyc,*.class,.svn
""set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
setlocal wildmode=full
set linebreak
" Don’t reset cursor to start of line when moving around.
set nostartofline
set cul             " underline active line
syntax on           " Switch on syntax highlighting.
syntax enable
set showmode        " Show the current mode
set showcmd         "Exibe comando sendo executado
set autoread
set autowrite       " write buffers automagically when leaving them
""set vb              " set visual bell --
"Word completion
set dictionary+=~/.vim/c_src/tags
set dictionary+=~/.vim/cpp_src/8/tags
set complete-=i
set complete+=.,w,k
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lbr
"set tw=500  " Linebreak on 500 characters
set showmatch

"---------------------------------------------------------------------------
" Searching
""---------------------------------------------------------------------------

set hlsearch          " Enable search highlighting
set ignorecase
set smartcase 
set infercase 
set incsearch         " Incrementally match the search
set wrapscan
""---------------------------------------------------------------------------
" Auto BreakIndent
""---------------------------------------------------------------------------
set textwidth=160
set expandtab    "no- Use spaces instead of tabs     
""set tabstop=8       " Tabstops are 2 spaces
set ts=8 noet       " Tabstops are 2 spaces
set shiftwidth=4  
"set softtabstop=4
""set softtabstop=-1
set autoindent      " auto indent
set smartindent 
set smarttab  " Be smart when using tabs ;)
set shiftround 
set backspace=2       " Allow backspacing over indent, eol, and the start of an insert

if exists('&breakindent')
    set breakindentopt=shift:4,min:20
endif

""---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
"set nofoldenable " Enable folding
set foldmethod=marker
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldnestmax=10
" By default, without wrapping
set nowrap
set title
set titleold="Terminal"
set titlestring=%F
""set gcr=a:blinkon0    "" Disable the blinking cursor.
set scrolloff=3
set modeline          "" Use modeline overrides
set modelines=2
set ch=2              " Make command line two lines high
set scrolloff=8       " When the page starts to scroll, keep the cursor 8 lines from the top and 8" lines from the bottom
set wildmenu          " Make the command-line completion better
"set diffopt+=iwhite   " Add ignorance of whitespace to diff
set clipboard+=unnamedplus  " Add the unnamed register to the clipboard
set lazyredraw        " Don't redraw when we don't have to
set showfulltag       " When completing by tag, show the whole tag, not just the function name
"------------------------------------End Global stuffs}}}
"     BEGIN PLUGINS INSTALL  {{{
"--------------------------------------------------------
"--AUTOCOMPLETION--
filetype on                    "Vundle required if installed
filetype plugin indent on
call plug#begin('~/.vim/bundle')
Plug 'brnfra/vim-shortcuts'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'hail2u/vim-css3-syntax'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vim-which-key' 
Plug 'michal-h21/vim-zettel'
Plug 'mzlogin/vim-markdown-toc'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/OmniCppComplete'
Plug 'vim-scripts/c.vim'
Plug 'vimwiki/vimwiki' 
Plug 'hecal3/vim-leader-guide'
Plug 'vim-scripts/bash-support.vim'
Plug 'aliou/bats.vim'
Plug 'vim-scripts/bats.vim'
" DEOPLETE"
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
    Plug 'Shougo/deoplete.nvim'
else
    if has('patch-8.1.2269')
	Plug 'ycm-core/YouCompleteMe' 
    else
	Plug 'ycm-core/YouCompleteMe', { 'commit':'d98f896' }
    endif
endif
call plug#end()
"-------------------------------------------------------
"     END PLUGINS  }}}1
"             PLUGINS CONFIG {{{1
"                 ALE.VIM  {{{2
"-------------------------------------------------------
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_autoimport = 1
"-----------------------------------END ALE.VIM}}}2
"              FUGITIVE                          {{{
"                                           }}}"
"COC{{{
if has('nvim')
    set shortmess+=c
    if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
    else
	set signcolumn=yes
    endif
    " other plugin before putting this into your config.

    inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <C-v> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-space> to trigger completion.
    if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
    else
	inoremap <silent><expr> <c-@> coc#refresh()
    endif
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use M to show documentation in preview window.
    nnoremap <silent> M :call <SID>show_documentation()<CR>
    function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
	    execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
	    call CocActionAsync('doHover')
	else
	    execute '!' . &keywordprg . " " . expand('<cword>')
	endif
    endfunction
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent! call CocActionAsync('highlight')
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    augroup CocGroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    " Applying codeAction to the selected region.
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif
    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif
""}}}
"              VIMWIKI {{{
" Height
"----------------------------------------------------------------
"hi VimwikiHeader1 term=none  cterm=bold  ctermfg=0   guifg=#006FFD  gui=bold 
"hi VimwikiHeader2 term=none  cterm=bold  ctermfg=0   guifg=#229379  gui=bold
"hi VimwikiHeader3 term=none  cterm=bold  ctermfg=0   guifg=#aa0000  gui=bold
"hi VimwikiHeader4 guifg=#FF00FF
"hi VimwikiHeader5 guifg=#00FFFF
"hi VimwikiHeader6 guifg=#FFFF00
"hi VimwikiH1Folding  term=bold  cterm=bold  ctermfg=204  guifg=#e5c07b gui=bold 
"hi VimwikiH2Folding  term=bold  cterm=bold  ctermfg=204  guifg=#98c379 gui=bold
"hi VimwikiH3Folding  term=bold  cterm=bold  ctermfg=204  guifg=#c678dd gui=bold
"hi VimwikiH4Folding guifg=#8096BF
"hi VimwikiH5Folding guifg=#8096BF
"hi VimwikiH6Folding guifg=#8096BF
"hi VimwikiLink  term=bold  cterm=bold,italic  ctermfg=204  guifg=#00655D gui=bold
"hi VimwikiBold  term=bold  cterm=bold  ctermfg=204  guifg=#E06C75 gui=bold
inoremap <C-x> <Plug>VimwikiIncreaseLvlSingleItem
inoremap <C-z> <Plug>VimwikiDecreaseLvlSingleItem
"Esc conflict"
""inoremap <C-]> <Plug>VimwikiTablePrevCell
"inoremap <C-[> <Plug>VimwikiTableNextCell
""nnoremap <C-]> <Plug>VimwikiTablePrevCell
""nnoremap <C-[> <Plug>VimwikiTableNextCell
nnoremap <C-Tab> <Plug>VimwikiPrevLink
nnoremap <C-n> <Plug>VimwikiDiaryNextDay
nnoremap <C-m> <Plug>VimwikiDiaryPrevDay
"              }}}
" VIM-LEADER-GUIDE{{{
"=================================================================================================================================
" Which Key Map  settings
"=================================================================================================================================
" Define prefix dictionary
let g:lmap =  {}

"}}}
"             VIM-WITCH-KEY {{{
"=================================================================================================================================
" Which Key Map  settings
"=================================================================================================================================
" Define prefix dictionary
let g:which_key_map = {}
let g:which_key_map.b = {}
let g:which_key_map.c = {}
let g:which_key_map.p = {}
let g:which_key_map.w = {}

if !exists('which_key#register')
   silent! call which_key#register('\', 'g:which_key_map')

endif

nnoremap <silent><leader> :WhichKey '\'<CR>
vnoremap <silent><leader> :WhichKeyVisual '\'<CR>

let g:which_key_default_group_name = ''
augroup Vimwiki
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
"-----------------------------------------------------------------
let g:which_key_sep = '→'
""let g:which_key_sep = ' ◆ '
let g:which_key_use_floating_win = 0
let g:which_key_use_floating_relative = 0
let g:which_key_align_by_seperator = 1
let g:which_key_flatten = 1
let g:which_key_run_map_on_popup = 0
let g:which_key_fallback_to_native_key=1
let g:which_key_disable_default_offset = 1
let g:which_key_exit = ["\<Esc>","\q"]
let g:which_key_hspace = 3
let g:which_key_vertical = 0
let g:which_key_max_size = 0
let g:which_key_sort_horizontal = 0

highlight default link WhichKey          Function
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Keyword
highlight default link WhichKeyDesc      Identifier
highlight default link WhichKeyFloating  Pmenu

" By default timeoutlen is 1000 ms
set timeoutlen=300
let g:which_key_map = {
    \
    \ '<F2>'    : [ ''                                               , 'Toggle NERDTree'             ] ,
    \ '<F3>'    : [ ''                                               , 'Toggle Number'               ] ,
    \ '<F4>'    : [ ''                                               , 'AutoIndent'                  ] ,
    \ '<F5>'    : [ ''                                               , 'Wrap Lines'                  ] ,
    \ '<F6>'    : [ ''                                               , 'Toggle Paste'                ] ,
    \ '<F7>'    : [ ''                                               , 'Toggle Fold'                 ] ,
    \ '<F8>'    : [ ''                                               , 'Turn OneLine All'            ] ,
    \ '<F9>'    : [ ''                                               , 'Toggle Local BreakIndent'    ] ,
    \ '\'       : [ ''                                               , 'Search <++> and enter'       ] ,
    \ 'D'       : [ '\\DD'                                           , 'Delete break lines'          ] ,
    \ 'd'       : [ '\\D'                                            , 'Delete blank lines'          ] ,
    \ 'h'       : [ '\\d'                                            , 'Delete spaces in the end'    ] ,
    \ 'V'       : [ '=v'                                             , 'Redraw vimrc'                ] ,
    \ 'v'       : [ '0v'                                             , 'Reload Vimrc '               ] ,
    \ 'e'       : [ '\\v'                                            , 'Edit Vimrc '                 ] ,
    \ 'l'       : [ '+l'                                             , 'Add a line after'            ] ,
    \ '1'       : [ '<C-L>'                                          , 'Diff update search '         ] ,
    \ '2'       : [ '<C-F12>'                                        , 'ctags -R           '         ] ,
    \ 'C'       : [ '<C-C>'                                          , 'Copy to xclip (visual)'      ] ,
    \ 's'       : [ '<C-S>'                                          , 'Save current file  '         ] ,
    \ 'q'       : [ '<C-Q>'                                          , 'Exit vim           '         ] ,
    \ 'L'       : [ '+L'                                             , 'Add a line before'           ] ,
    \ }
let g:which_key_map.c = {
    \ 'name'    : '+Commands',
    \
    \ '1'   : [ '\\K'                                                , 'Get Man page 1'              ] ,
    \ '2'   : [ '\\M'                                                , 'Get Man Page 2'              ] ,
    \ }

let g:which_key_map.p = {
    \ 'name' : '+From_Plugins',
    \
    \ '['       : [ '<Plug>(MatchitNormalMultiBackward)'  , '(MatchitNormalMultiBackward)   ' ] ,
    \ ']'       : [ '<Plug>(MatchitNormalMultiForward)'   , '(MatchitNormalMultiForward)    ' ] ,
    \ 'S'       : [ '<Plug>CSurround'                     , 'Changes surroundings           ' ] ,
    \ 's'       : [ '<Plug>Csurround'                     , 'Substitute cs!} !->}           ' ] ,
    \ 'd'       : [ '<Plug>Dsurround'                     , 'Delete surround ds"            ' ] ,
    \ 'g'       : [ '<Plug>(MatchitNormalBackward)'       , 'Matchit Normal Backward        ' ] ,
    \ 'u'       : [ '<Plug>Commentary<Plug>Commentary'    , 'Undo Commentary                ' ] ,
    \ 'c'       : [ '<Plug>CommentaryLine'                , 'Commentary Line                ' ] ,
    \ 'C'       : [ '<Plug>Commentary'                    , 'Commentary                     ' ] ,
    \ 'a'       : [ '\a'                                  , 'EasyAlign delim -> <Space>,=, :, ., |, &, #, and ,' ] ,
    \ 'e'       : [ 'EasyAlign'                           , 'EasyAlign command Start        ' ] ,
    \ 'l'       : [ 'LiveEasyAlign'                       , 'Live interactive mode          ' ] ,
    \
    \ }

let g:which_key_map.f = {
    \ "name" : "+FZF",
    \
    \ "f"    : ['Files'                                        , 'Search Files'                ] ,
    \ "l"    : ['BLines'                                       , 'Search Lines Buffers'        ] ,
    \ "o"    : ['Colors'                                       , 'Search Color Themes'         ] ,
    \ "t"    : ['BTags'                                        , 'Search Tags'                 ] ,
    \ "b"    : ['Buffers'                                      , 'Search Open Buffers'         ] ,
    \ "i"    : ['GFiles'                                       , 'Search Git-Files'            ] ,
    \ "g"    : ['GFiles?'                                      , 'Search Modified-Git-Files'   ] ,
    \ "a"    : ['Ag'                                           , 'Search Ag'                   ] ,
    \ "r"    : ['Rg'                                           , 'Search Rg'                   ] ,
    \ "m"    : ['Marks'                                        , 'Search Marks'                ] ,
    \ "w"    : ['Windows'                                      , 'Search Windows'              ] ,
    \ "c"    : ['Commands'                                     , 'Search Commands'             ] ,
    \
    \ }

let g:which_key_map.b = {                       
       \ 'name' : '+buffer' ,                     
       \ '1' : ['b1'        , 'buffer 1']        ,
       \ '2' : ['b2'        , 'buffer 2']        ,
       \ 'd' : ['bd'        , 'delete-buffer']   ,
       \ 'f' : ['bfirst'    , 'first-buffer']    ,
       \ 'h' : ['Startify'  , 'home-buffer']     ,
       \ 'l' : ['blast'     , 'last-buffer']     ,                                             
       \ 'n' : ['bnext'     , 'next-buffer']     ,
       \ 'p' : ['bprevious' , 'previous-buffer'] ,
       \ '?' : ['Buffers'   , 'fzf-buffer']      ,
       \ }  

let g:which_key_map.w = {
    \ 'name' : '+VimWiki',
    \
    \ "w"    : ['\\ww'                                        , 'Go To Index'                           ] ,
    \ "n"    : [''                                            , 'Create new wiki page'                  ] ,
    \ "D"    : [''                                            , 'Delete wiki page'                      ] ,
    \ "r"    : [''                                            , 'Rename wiki page'                      ] ,
    \ "v"    : [''                                            , 'Toggle wiki List'                      ] ,
    \ "s"    : ['VimwikiSearchTags'                           , 'Search-for-wiki-TAGS'                  ] ,
    \ "S"    : ['VimwikiSearch '                              , 'Search /pattern/'                      ] ,
    \ 'o'    : [ '\w\m'                                       , 'Make Tomorrow Diary Note'              ] ,
    \ 'y'    : [ '\w\y'                                       , 'Make Yesterday Diary Note'             ] ,
    \ '3'    : [ '\w\t'                                       , 'Tab Make Diary Note'                   ] ,
    \ 'd'    : [ '\w\w'                                       , 'Make Diary Note'                       ] ,
    \ 'l'    : [ '\w\i'                                       , 'Diary Generate Links'                  ] ,
    \ 'I'    : [ '\wi'                                        , 'Diary Index'                           ] ,
    \ '7'    : [ '\ws'                                        , 'UI Select'                             ] ,
    \ 'b'    : [ '\wt'                                        , 'Tab Index'                             ] ,
    \ '-'    : [ '<C-M>'                                      , 'Diary Prev Day'                        ] ,
    \ '+'    : [ '<C-N>'                                      , 'Diary Next Day'                        ] ,
    \ '<Tab>': [ '<C-Tab>'                                    , 'Prev Link'                             ] ,
    \ '0'    : [ '<C-[>'                                      , 'Table Next Cell'                       ] ,
    \ '9'    : [ '<C-]>'                                      , 'Table Prev Cell'                       ] ,
    \
    \ 'c'    : {
    \ 'name' : '+CheckBox',
    \
    \ "i"    : ['VimwikiToggleListItem'                       , 'Toggle checkbox On/Off'       ] ,
    \ "n"    : ['VimwikiIncrementListItem'                    , 'Toggle checkbox Next/Previous'] ,
    \
    \ },
    \
    \ 'T'    : {
    \ 'name' : '+Tables',
    \
    \ "1"    : ['VimwikiTable'                                , 'Create Table'                             ] ,
    \ "t"    : ['VimwikiTOC'                                  , 'Create Table Of Contents(TOC)'            ] ,
    \ "h"    : ['<Plug>VimwikiTableMoveColumnLeft'            , 'Move current column to the left'          ] ,
    \ "l"    : ['<Plug>VimwikiTableMoveColumnRight'           , 'Move current column to the Right'         ] ,
    \
    \ },
    \
    \ 'z'    : {
    \ 'name' : '+Zettel',
    \
    \ "b"    : ['ZettelBackLinks'                             , 'add-backlineks'                           ] ,
    \ "n"    : ['ZettelNew'                                   , 'add-new'                                  ] ,
    \ "o"    : ['ZettelOpen'                                  , 'Search fulltext use FZF'                  ] ,
    \ "i"    : ['ZettelInsertNote'                            , 'Using FZF and insert in the current'      ] ,
    \ "s"    : ['ZettelSearch'                                , 'Search the content of your zettelkasten'  ] ,
    \ "y"    : ['ZettelYankName'                              , 'Copy the current zettel file name'        ] ,
    \
    \ },
    \
    \ }

"              }}}
"              VIM-SENSIBLE {{{
if has('nvim')
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible()==0|silent! pclose|endif
    " Complete options (disable preview scratch window)
    set completeopt+=menuone,noinsert,longest,preview,noselect
    " Limit popup menu height
    set pumheight=15
endif
"              }}}
"             Netrw configuration       {{{2
""------------------------------------------------------
let g:loaded_netrw       = 0
let g:loaded_netrwPlugin = 1
let shownetrw =0
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" hide gitignore'd files
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default (this is the string toggled by netrw-gh)
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
if shownetrw
    let g:netrw_menu=1
    let g:netrw_preview=1
    let g:netrw_browse_split=2
    "autocmd VimEnter * :Vexplore
endif
function! NetrwOnBufferOpen()
    if exists('b:noNetrw')
	return
    endif
    call ToggleNetrw()
endfun

""-----------------------------------------END NETRW }}}2
"              NERDTree configuration      {{{2
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
"---------------------------------END NERDTree }}}2
"               VIM-AIRLINE     {{{2
""--------------------------------------------------------
let g:airline_theme = 'papercolor'
let g:airline_symbols_ascii = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_focuslost_inactive = 1
let g:airline_skip_empty_sections = 1
let g:airline_detect_spell=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_mode_map = {
	    \ '__'     : '-',
	    \ 'c'      : 'COMMAND',
	    \ 'i'      : 'INSERT',
	    \ 'ix'     : 'I',
	    \ 'ic'     : 'I',
	    \ 'multi'  : 'MULTI',
	    \ 'n'      : 'NORMAL',
	    \ 'no'     : 'NORMAL',
	    \ 'ni'     : 'N',
	    \ 'R'      : 'REPLACE',
	    \ 'S'      : 'S',
	    \ 's'      : 'S',
	    \ ''       : 'V',
	    \ 't'      : 'T',
	    \ 'V'      : 'VISUAL',
	    \ 'v'      : 'VISUAL',
	    \ 'Rv'     : 'R',
	    \ '/'      : 'SEARCH',
	    \ '^V'     : 'VISUAL BLOCK',
	    \  }
let g:airline_filetype_overrides = {
	    \ 'coc-explorer':  [ 'CoC Explorer', '' ],
	    \ 'gundo': [ 'Gundo', '' ],
	    \ 'help':  [ 'Help', '%f' ],
	    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
	    \ 'vim-plug': [ 'Plugins', '' ],
	    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
	    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
	    \ }
""* enable/disable ale integration >
let airline#extensions#ale#error_symbol         = 'E:'
let airline#extensions#ale#warning_symbol       = 'W:'
let airline#extensions#ale#show_line_numbers    = 1
let airline#extensions#ale#open_lnum_symbol     = '(L'
let airline#extensions#ale#close_lnum_symbol    = ')'
let g:airline#extensions#keymap#enabled         = 1
let g:airline#extensions#bookmark#enabled       = 1
"powerline"
let g:airline#extensions#tabline#right_sep      = "\u2591\u2592\u2593"
let g:airline#extensions#tabline#left_sep       = "\u2593\u2592\u2591"
let g:airline#extensions#tabline#right_alt_sep  = "\u2593\u2592\u2591"
let g:airline#extensions#tabline#left_alt_sep   = "\u2593\u2592\u2591"
let g:airline_right_alt_sep                     = "\u2591\u2592\u2593"
let g:airline_left_alt_sep                      = "\u2593\u2592\u2591"
let g:airline_left_sep	                        = "\u2593\u2592\u2591"
let g:airline_right_sep	                        = "\u2593\u2592\u2591"
let g:airline_symbols.branch                    = ''
let g:airline_symbols.colnr                     = ' ℅:'
let g:airline_symbols.readonly                  = ''
let g:airline_symbols.linenr                    = ' :'
let g:airline_symbols.maxlinenr                 = '☰ '
let g:airline_symbols.dirty                     = '⚡'
let g:airline_section_c                         = '%r%m%t %-0.50{CurDir()}'
let g:airline_section_x                         = '%y'
let g:airline_section_z                         = '%p%% %l Col:%c'
let g:airline_section_error                     = ''
let g:airline_section_warning                   = ''
"+-------------------------------------------------------+
"| Set advanced status line				 |
"+-------------------------------------------------------+
"| https://vimhelp.org/options.txt.html#%27statusline%27 |
"+-------------------------------------------------------+
""set laststatus=2      "" display Status bar always
fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfun
"------------------------------------END VIM-AIRLINE }}}2
"              COLORSCHEME {{{2
""------------------------------------------------------
set background=light
if has('unix')
    colorscheme papayadroid
else
    silent!colorscheme base16-ateliercave
endif
" Terminals that support italics
let s:terms_italic=[
	    \"rxvt",
	    \"gnome-terminal",
	    \"xterm",
            \"xterm2",
            \"xfce4-terminal"
            \]
""---------------------------------END COLORSCHEME }}}2
"             DEOPLETE{{{
let g:python3_host_prog = "/usr/bin/python3.9"
let g:ruby_host_prog = '$HOME/.gem/ruby/2.7.0/bin/neovim-ruby-host'
"              }}} "
"             YOUCOMPLETEME {{{
let g:ycm_language_server =
	    \ [{
	    \   'name': 'ccls',
	    \   'cmdline': [ 'ccls' ],
	    \   'filetypes': [ 'c', 'cpp', 'cuda', 'objc', 'objcpp' ],
	    \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
	    \ }]
"              }}}
"              C.VIM {{{
let g:C_MapLeader  = ','
let tlist_template_settings  = 'template;t:template'
"---------------------------------------------------------------
" plugin templates : set filetype for *.template  
"---------------------------------------------------------------
if has("autocmd")
    autocmd BufNewFile,BufRead Templates  set filetype=template
    autocmd BufNewFile,BufRead *.template  set filetype=template
endif " has("autocmd")
"              }}}
"              OMNICOMPLETE{{{
" configure tags - add additional tags here or comment out not-used ones
set tags-=./tags,tags
set tags+=~/.vim/c_src/tags?
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -I _GLIBCXX_NOEXCEPT .<CR>
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" also necessary for fixing LIBSTDC++ releated stuff
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
"              }}}
"              CSupport{{{
"---Configurações de plugin do vim 'C Support - csupport.zip'------------------
let g:C_FormatDate = '%d/%m/%Y'
let g:C_FormatTime = '%H:%M'
let g:C_Styles = { '*.c,*.h' : 'default', '*.cc,*.cpp,*.hh' : 'CPP' }
"              }}}
"                    TAGBAR     {{{2
"-------------------------------------------------------
nnoremap <leader>t :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1
let g:tagbarOpenAutoClose = 1
let g:tagbar_autoclose = 1
" set default width of the Tagbar window
let g:tagbar_width = 30
" markdown support
let g:tagbar_type_markdown = {
	    \ 'ctagstype': 'markdown',
	    \ 'kinds': [ 'h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3' ]
	    \ }
"------------------------------------------------------}}}2
"               END PLUGINS CONFIG"}}}1
"                  AUTOCMD RULES {{{
"-------------------------------------------------------
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
"----------------------------------------------------------------
let g:easy_align_delimiters = {
    \ '>': { 'pattern': '>>\|=>\|>'  },
    \ '/': {
    \     'pattern':         '//\+\|/\*\|\*/',
    \     'delimiter_align': 'l',
    \     'ignore_groups':   ['!Comment'] },
    \ ']': {
    \     'pattern':       '[[\]]',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \     'stick_to_left': 0
    \   },
    \ ')': {
    \     'pattern':       '[()]',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \     'stick_to_left': 0
    \   },
    \ 'd': {
    \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
    \     'left_margin':  0,
    \     'right_margin': 0
    \   }
    \ }


" }}}
"autocmd vimenter * NERDTree  {{{
if !has('nvim')
    autocmd VimEnter * exec ":loadview"
endif
"}}}
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
au BufRead,BufNewFile *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown
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
set cot-=preview	"disable doc preview in omnicomplete
"---------------------------------------------
" for PHP programming
"---------------------------------------------
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
"---------------------------------------------
" for edit CSS
"---------------------------------------------
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss			set ft=scss.css
autocmd BufNewFile,BufRead *.sass			set ft=sass.css
"---------------------------------------------
" for edit HTML
"---------------------------------------------
autocmd FileType html,xhtml setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
let mapleader="\\" "Map <Leader> to \
let maplocalleader=";"
"-------------------------------------------END SYNTAX }}}
"                     COMPLETE MAPS     
"-------------------------------------------------------
noremap <C-q> :q<cr>
noremap <C-Q> :q!<cr>
noremap <C-s> :wall<cr>:mkview<cr>
inoremap <C-s> <esc><esc>:w<CR>:mkview<cr>
"--------------------------------------------------------
""                 Abbreviations
"--------------------------------------------------------
" Permite recarregar o vim para que modificações no
" próprio vimrc seja ativadas com o mesmo sendo editado
nnoremap 0v :<C-u>source ~/.vimrc <BAR> echo "Vimrc reloaded!"<CR>
nnoremap 0V :<C-u>source ~/.vimrc <BAR> echo "Vimrc redraw!"<CR>:redraw!<cr>
noremap =v :source ~/.vimrc<CR>:redraw!<cr>
noremap =V :source ~/.vimrc<CR>:redraw!<cr> 
noremap <leader>v :e ~/.vimrc<CR>  
noremap <leader>V :e ~/.vimrc<CR> 
"" this shortcuts will make word type errors
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
"---------------------------------------------
"           copy to system buffer
"---------------------------------------------
vnoremap <C-c> :w !xclip -selection clipboard -i<cr><cr>
"colar area de transferencia xclip"
noremap <C-p> :r!xclip -o +\%c<cr>
"inoremap <C-p> <esc>:r!xclip -o +\%c<cr>i
inoremap <C-p> <esc>:r!xclip -o <cr>i
"---------------------------------------------
"                   EDITING
"---------------------------------------------
"<M-...>		alt-key or meta-key		meta alt <M-
"<D-...>		command-key (Mac) / super (GTK)	<D-
inoremap <M-BS> <Esc><Right>dwi
inoremap <BS>   <Esc><Right>dbi
inoremap <M-z>  <Esc>0i
inoremap <M-x>  <Esc>$i<Right>
inoremap <M-a>  <S-Left>
inoremap <M-w>  <S-Right>
inoremap <M-Down>  <Esc>5<Down>i<Right>
inoremap <M-Up>    <Esc>5<Up>i<Right>
inoremap <M-Left>  <Esc>5bi<Right>
inoremap <M-Right> <Esc>5wi<Right>

inoremap <c-g> <esc>
" show number on/off""
noremap <F3> :call ToggleHidden()<CR>10h          
"toggle show spaces"
inoremap <F3> <esc>:set list! list?<CR>li
"easy indent all the file
nnoremap <F4> gg=G
"easy indent all the file
inoremap <F4> <esc>gg=Gli
"toggle wrap"
noremap <F5> :set wrap! wrap?<CR>
"toggle wrap"
inoremap <F5> <esc>:set wrap! wrap?<CR>li
set pastetoggle=<F6>
noremap <F7> :call ToggleFold()<cr>
inoremap <F7> <esc>:call ToggleFold()<cr>i
noremap <F8> :call OneLineAllText()<cr>v$
inoremap <F8> <esc>:call OneLineAllText()<cr>v$
nnoremap <F9> :execute('setlocal wrap! breakindent!')<CR>
inoremap <F9> <esc>:execute('setlocal wrap! breakindent!')<CR>i
"fold selected
noremap <leader>f :call ToggleCreateFold()<cr>
vnoremap <leader>f :call ToggleCreateFold()<cr>
inoremap <leader>f <esc>:call ToggleCreateFold()<cr>i
" Move lines: Shift+(seta abaixo) ou (seta acima)
" Move Block down"
vnoremap <S-down> VdjP`[v`]
" Move Block up"
vnoremap <S-up> VdkP`[v`]
"repeate selection block"
vnoremap <C-d> VOyP`[v`]
"repeate line bellow
inoremap <C-d> <esc>$v0y$o<esc>p<up>$<esc>i
nnoremap <C-d> $v0y$o<esc>p<up>$<esc>

inoremap <S-Down> <esc>ddp<esc>i
nnoremap <S-Down> <esc>ddp<esc>
inoremap <S-Up> <esc>ddkP<esc>i
nnoremap <S-Up> <esc>ddkP<esc>

"close tags
inoremap <leader>/ </<C-X><C-O>
inoremap <C-up> <esc>5ki
inoremap <C-down> <esc>5ji
inoremap <C-left> <esc>hbi
inoremap <C-right> <esc>lwi
" Visual
nnoremap <silent> vi" ?"<CR><space>v/"<CR><BS>
nnoremap <silent> vi' ?'<CR><space>v/'<CR><BS>
nnoremap <silent> vi` ?`<CR><space>v/`<CR><BS>
nnoremap <silent> va" ?"<CR>v/"<CR>
nnoremap <silent> va' ?'<CR>v/'<CR>
nnoremap <silent> va` ?`<CR>v/`<CR>
" Delete
nnoremap <silent> di" ?"<CR><space>v/"<CR><BS>d
nnoremap <silent> di' ?'<CR><space>v/'<CR><BS>d
nnoremap <silent> di` ?`<CR><space>v/`<CR><BS>d
nnoremap <silent> da" ?"<CR>v/"<CR>d
nnoremap <silent> da' ?'<CR>v/'<CR>d
nnoremap <silent> da` ?`<CR>v/`<CR>d
" Change
nnoremap <silent> ci" ?"<CR><space>v/"<CR><BS>c
nnoremap <silent> ci' ?'<CR><space>v/'<CR><BS>c
nnoremap <silent> ci` ?`<CR><space>v/`<CR><BS>c
nnoremap <silent> ca" ?"<CR>v/"<CR>c
nnoremap <silent> ca' ?'<CR>v/'<CR>c
nnoremap <silent> ca` ?`<CR>v/`<CR>c
"Yank"
nnoremap Y y$
"redo"
nnoremap U :redo<cr>
"select ALL"
nnoremap <C-a> ggVG
"call goyo-plugin"
noremap ,g :Goyo 120x90%<CR>
"delete blank spaces"
noremap <leader>d :%s/\s\+$//<CR>    
"delete blank lines
noremap <leader>DD :g/^\s*$/d<CR>
noremap <leader>D :%s!\n\n\n\+!\r\r!g<CR>
"noremap <leader>D :%!cat: -s<CR>
"manual entry
noremap <leader>M :call <SNR>44_PreGetPage(0)<CR>
inoremap <leader>M <ESC>:call <SNR>44_PreGetPage(0)<CR>i
" inserir linhas e continuar em modo normal
noremap +l o<ESC>:echo<CR>
noremap +L O<ESC>:echo<CR>
"autocompletion document with ctrl+space
inoremap <c-space> <c-n>
" Ativa fechamento automático para parêntese
" Set automatic expansion of parenthesis/brackets

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap ' ''<left>
inoremap " ""<left>
"surround "" ou '' ss or SS for surround special chars
"only words s or S
nnoremap <leader>s bcw""<esc>P
nnoremap <leader>ss BcW""<esc>P
nnoremap <leader>S bcw''<esc>P
nnoremap <leader>SS BcW''<esc>P
inoremap <leader>s <esc>bcw""<esc>Pi
inoremap <leader>ss <esc>BcW""<esc>Pi
inoremap <leader>S <esc>bcw''<esc>Pi
inoremap <leader>SS <esc>BcW''<esc>Pi

"by @LukeSmithxyz"
let s:hidden_all = 1 
function ToggleHidden()
    if s:hidden_all == 0
	let s:hidden_all = 1
	set number
	set ruler
	set relativenumber
	set laststatus=2
	set list
    else
	let s:hidden_all = 0
	set nonumber
	set noruler
	set norelativenumber
	set laststatus=0
	set nolist
    endif
endfunction
let s:fold_all = 1 
function ToggleFold()
    if s:fold_all == 0
	let s:fold_all = 1
	:%foldclose!
    else
	let s:fold_all = 0
	:%foldopen!
    endif
endfunction
function ToggleCreateFold()
    if foldclosed(".") < 0
	let s:make_fold = 0
	:'<,'>fold
    else
	:normal zd
    endif
endfunction
function OneLineAllText()
    :%j
endfunction    
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
inoremap <S-down> <esc>ddp<esc>i
nnoremap <S-down> <esc>ddp<esc>
inoremap <S-up> <esc>ddkP<esc>i
nnoremap <S-up> <esc>ddkP<esc>
" terminal emulation
nnoremap <silent> <leader>l :terminal<CR>
" split window"
nnoremap <leader>/ :split<cr>
nnoremap <leader>- :vsplit<cr>
"" Switching windows buffer(NerdTree)
nnoremap <C-down> <C-W>j    "v
nnoremap <C-up> <C-W>k   "^
nnoremap <C-left> <C-W>h    "<
nnoremap <C-right> <C-W>l    ">
""nnoremap <S-up> <C-w>w
nnoremap <C-+> <C-W>+
nnoremap <C--> <C-W>-
"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-t> :tabnew<CR>
"-------------------------------------------------------
"" Custom configs
"-------------------------------------------------------
" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
" javascript
let g:javascript_enable_domhtmlcss = 1
" vim-javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END
" for error highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
"--------------------------------------------------------END MAPS  
