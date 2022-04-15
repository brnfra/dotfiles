"====================================================================
" Arquivo: .vimrc
" Autor: Bruno Franco
" Ultima_modificacao: 13-04-2022
" Download: git@github.com:brnfra
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
set nocompatible    " be iMproved, required
set shell=$SHELL\ -f
set path+=**
set exrc
scriptencoding utf-8
set secure
set history=1500
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

set undofile " Persistent Undoo
if !has('nvim')
    set viminfo=<500,:100,/50,%,'50,h,f0,s512
    set viminfo+=n~/.vim/.viminfo
else
    set viminfo+=n~/.vim/.shada
endif

set mouse=a " Enable mouse in all modes
set cursorcolumn
set cursorline
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
" ignore these files while expanding wild chars
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg,*pdf
set wildignore+=*.swp,*.bak,*.pyc,*.class,.svn
""set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set linebreak
set foldcolumn=4
set foldclose=all
set foldmethod=marker
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
setlocal wildmode=full

"Word completion
set dictionary+=~/.vim/c_src/tags
set dictionary+=~/.vim/cpp_src/8/tags
set complete-=i
set complete+=.,w,k
"set infercase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=8       " Tabstops are 2 spaces
set shiftwidth=4
set softtabstop=4
set autoindent      " auto indent
set smartindent
set smarttab  " Be smart when using tabs ;)
set noexpandtab   "no- Use spaces instead of tabs
set lbr
set tw=500  " Linebreak on 500 characters
set showmatch
set textwidth=160
"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
" Local directories {{{
set backupdir=~/.vim/backups/
set directory=~/.vim/backups/swaps/
set undodir=~/.vim/backups/undo/
" }}}
set foldenable " Enable folding
set foldcolumn=0 " Column to show folds
set foldlevel=0 " Close all folds by default

set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1

" By default, without wrapping
set nowrap
set title
set titleold="Terminal"
set titlestring=%F
set gcr=a:blinkon0    "" Disable the blinking cursor.
set scrolloff=3
set modeline          "" Use modeline overrides
set modelines=2
set ch=2              " Make command line two lines high
set backspace=2       " Allow backspacing over indent, eol, and the start of an insert
set scrolloff=8       " When the page starts to scroll, keep the cursor 8 lines from the top and 8" lines from the bottom
set wildmenu          " Make the command-line completion better

"set diffopt+=iwhite   " Add ignorance of whitespace to diff

set hlsearch          " Enable search highlighting
set incsearch         " Incrementally match the search
set clipboard+=unnamedplus  " Add the unnamed register to the clipboard
set lazyredraw        " Don't redraw when we don't have to
set showfulltag       " When completing by tag, show the whole tag, not just the function name

" --- sane text files -------   Encoding ----"
set encoding=utf-8
set ttyfast
if !has('nvim')
    set ttymouse=xterm2
endif

"------------------------------------End Global stuffs}}}
"     BEGIN PLUGINS INSTALL  {{{
"--------------------------------------------------------
"--AUTOCOMPLETION--
filetype on                    "Vundle required if installed
filetype indent on
filetype plugin on
filetype plugin indent on

call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

" DEOPLETE"
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'roxma/nvim-yarp'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Code Snnipets"
if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
    if has('patch-8.1.2269')
	Plug 'ycm-core/YouCompleteMe' 
    else
	Plug 'ycm-core/YouCompleteMe', { 'commit':'d98f896' }
    endif
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
"syntax
Plug 'hail2u/vim-css3-syntax'
"c/c++"
Plug 'vim-scripts/OmniCppComplete'
Plug 'vim-scripts/c.vim'
"Table Of Contents[toc]
Plug 'mzlogin/vim-markdown-toc'
""let g:plug_url_format = 'git@github.com:%s.git'
Plug 'brnfra/vim-shortcuts'
Plug 'brnfra/vim-markdown-brn'
""unlet g:plug_url_format
call plug#end()
"-------------------------------------------------------
"     END PLUGINS  }}}1
"             PLUGINS CONFIG {{{1
"              FUGITIVE                          {{{
if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif
"                                           }}}"
"COC{{{
if has("nvim")
    set shortmess+=c
    if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
    else
	set signcolumn=yes
    endif
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
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
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

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
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
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
"              VIM-SENSIBLE {{{
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible()==0|silent! pclose|endif
" Complete options (disable preview scratch window)
set completeopt+=menuone,noinsert,longest,preview,noselect
" Limit popup menu height
set pumheight=15
"              }}}
"             Netrw configuration       {{{2
""------------------------------------------------------
let g:loaded_netrw       = 1
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
    autocmd VimEnter * :Vexplore
endif
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

if !has('nvim')
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |   endif
endif

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeTooggle = 1
let g:NERDTreeWinSize = 40
"Disable arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
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
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#fugitiveline#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_exclude_preview = 0
let g:airline_detect_modified=1
let g:airline_inactive_alt_sep=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
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
	    \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
	    \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
	    \ 'gundo': [ 'Gundo', '' ],
	    \ 'help':  [ 'Help', '%f' ],
	    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
	    \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
	    \ 'startify': [ 'startify', '' ],
	    \ 'vim-plug': [ 'Plugins', '' ],
	    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
	    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
	    \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
	    \ }

""* enable/disable ale integration >
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'
let g:airline#extensions#keymap#enabled=1
let g:airline#extensions#capslock#enabled=1
let g:airline#extensions#bookmark#enabled=1
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_right_alt_sep =''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#csv#column_display = 'Name'
" --------------Status line
"+---------------------------------------------------------------------------+
"| A | B |                     C                          X | Y | Z |  [...] |
"+---------------------------------------------------------------------------+
"  let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"  let g:airline_section_b       (hunks, branch)[*]
"  let g:airline_section_c       (bufferline or filename, readonly)
"  let g:airline_section_gutter  (csv)
"  let g:airline_section_x       (tagbar, filetype, virtualenv)
"  let g:airline_section_y       (fileencoding, fileformat, 'bom', 'eol')
"  let g:airline_section_z       (percentage, line number, column number)
"  let g:airline_section_error   (ycm_error_count, syntastic-err, eclim,
"                                languageclient_error_count)
"  let g:airline_section_warning (ycm_warning_count, syntastic-warn,
"                                 languageclient_warning_count, whitespace)
let g:airline_section_b=" %{FugitiveHead()}"
let g:airline_section_c='%r%m%0*%t %1* %-0.50{CurDir()}'
let g:airline_section_x='%k%y'
let g:airline_section_z='%p%% %l Col:%c'
let g:airline_section_error=''
let g:airline_section_warning=''

"+-------------------------------------------------------+
"| Set advanced status line				 |
"+-------------------------------------------------------+
"| https://vimhelp.org/options.txt.html#%27statusline%27 |
"+-------------------------------------------------------+
set laststatus=2      "" display Status bar always
fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfun

"------------------------------------END VIM-AIRLINE }}}2
"               INDENTLINE              {{{2
"-------------------------------------------------------
let g:indentLine_enabled = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setColors = 0
let g:indentLine_char ='┊'

"------------------------------------END INDENTLINE.VIM }}}2
"              COLORSCHEME {{{2
""------------------------------------------------------
if (has('win32') || has('win64'))
    "let g:solarized_termcolors=256
endif
let g:solarized_termcolors=256

set background=dark
if has('unix')
    colorscheme solarized
else
    silent!colorscheme base16-ateliercave
endif

" Terminals that support italics
let s:terms_italic=[
	    \"rxvt",
	    \"gnome-terminal"
	    \]

""---------------------------------END COLORSCHEME }}}2
"                 ALE.VIM  {{{2
"-------------------------------------------------------
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_autoimport = 1

"-----------------------------------END ALE.VIM}}}2
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
"              C.VIM {{{
let g:C_MapLeader  = '\'
let tlist_template_settings  = 'template;t:template'
"---------------------------------------------------------------
" plugin templates : set filetype for *.template  
"---------------------------------------------------------------
if has("autocmd")
    autocmd BufNewFile,BufRead Templates  set filetype=template
    autocmd BufNewFile,BufRead *.template  set filetype=template
endif " has("autocmd")
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
" EasyAlign.vim {{{
augroup easy_align_config
    autocmd!
    vmap <Enter> <Plug>(EasyAlign) " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    nmap <Leader>a <Plug>(EasyAlign) " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
augroup END
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
autocmd FileType c,cpp,cc set cindent
" Java specific settings
au BufNewFile,BufRead *.java set ft=java
" Associate uncommon filetypes
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile md set filetype=markdown
au BufRead,BufNewFile .rspec set filetype=eruby
au BufRead,BufNewFile *.workflow set filetype=hcl
au BufRead,BufNewFile *.acl set filetype=vcl
au BufRead,BufNewFile txt set filetype=markdown
au BufRead,BufNewFile vifminfo,vifmrc set filetype=vim
au BufRead,BufNewFile config set filetype=bash
au BufRead,BufNewFile sh set filetype=bash
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
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" use syntax complete if nothing else available
"autocmd FileType html,php,markdown,css,c,java,javascript,js,xml,phyton set foldmethod=indent
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
let mapleader="," " Map <Leader> to ,
let g:mapleader=","
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
nnoremap 0v :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
nnoremap 0V :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>:redraw!<cr>
noremap =v :source ~/.vimrc<CR>:redraw!<cr>  " Para recarregar o .vimrc
noremap =V :source ~/.vimrc<CR>:redraw!<cr>  " Para recarregar o .vimrc
noremap <leader>v :e ~/.vimrc<CR>  " para editar o .vimrc
noremap <leader>V :e ~/.vimrc<CR>  " para editar o .vimrc

"" this shortcuts will make improve type errors
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
noremap <C-c> :'<,'>:w !xclip -selection clipboard -i<cr><cr>
"colar area de transferencia xclip"
noremap <C-v> :r!xclip -o +\%c<cr>
inoremap <C-v> <esc>:r!xclip -o +\%c<cr>i
"---------------------------------------------
"                   EDITING
"---------------------------------------------
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

"redo"
nnoremap U :redo<cr>
"select ALL"
nnoremap <C-a> ggVG
"call goyo-plugin"
noremap ,g :Goyo 120x90%<CR>
"delete blank spaces"
noremap ,d :%s/\s\+$//<CR>    
"delete blank lines
noremap ,D :g/^\s*$/d<CR>
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

let s:hidden_all = 1 "by @LukeSmithxyz"
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
