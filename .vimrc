"====================================================================
" Arquivo: .vimrc
" Autor: Bruno Franco
" Ultima_modificacao: 02-08-2021
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
"Nerd-Fonts  - https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
"PATH(Debian)- placing FONTS them into /usr/local/share/fonts (system-wide), ~/.local/share/fonts (user-specific)
"                  System Config {{{
"-------------------------------------------------------
set nocompatible    " be iMproved, required
set path+=**
set exrc
scriptencoding utf-8
set secure
set makeprg=make\ -C\ ../build\ -j9
nnoremap <F3> :make!<cr>

let g:dl1 = '~/.vim/autoload'
let g:dl2 = '~/.vim/bundle'
let g:cur = getcwd()

let g:dw1 = 'C:\Program Files\Vim\vim82\autoload'
let g:dw2 = 'C:\Program Files\Vim\vim82\bundle'


if has('unix')
    "-------------------------------------------------------
    "                   Plugins Install (UNIX)
    "-------------------------------------------------------

    autocmd VimEnter * echo "Seja bem vindo ao vim. Seu sistema é Unix!"
    autocmd VimEnter * call Base(dl1,dl2)
    "digite :AddBase"
    :command AddBase call Base(dl1,dl2)<CR>

    function! Base(dl1,dl2) abort
        "autoload
        "bundle

        if empty(glob("~/.vim/autoload/"))
            silent exec "!mkdir -p ~/.vim/autoload/"
        endif
        if empty(glob("~/.vim/bundle/"))
            silent exec "!mkdir -p ~/.vim/bundle/"
        endif

        if empty(glob("~/.vim/backups/"))
            silent exec "!mkdir -p ~/.vim/backups/"
        endif
        if empty(glob("~/.vim/backups/swaps/"))
            silent exec "!mkdir -p ~/.vim/backups/swaps/"
        endif
        if empty(glob("~/.vim/backups/undo/"))
            silent exec "!mkdir -p ~/.vim/backups/undo/"
        endif

        exec ":redraw!"

        "Option - 1) junegunn /vim-plug "

        silent exec 'cd' a:dl1
        if !filereadable("plug.vim")

            silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
            "force redraw screen
            silent exec 'cd' g:cur
            silent exec ":redraw!"

        else
            echo 'Autoload files and Path OK.'
            silent exec 'cd' g:cur
        endif

    endfunction


elseif (has('win32') || has('win64'))

    autocmd VimEnter * echo "Seja bem vindo ao vim. Seu sistema é Windows!"
    :command AddBase call Base(dw1,dw2)<CR>

    "-------------------------------------------------------"
    "		Set System
    "		Original file _vimrc windows
    "-------------------------------------------------------

    " Vim with all enhancements
    source $VIMRUNTIME/vimrc_example.vim

    " Use the internal diff if available.
    " Otherwise use the special 'diffexpr' for Windows.
    if &diffopt !~# 'internal'
        set diffexpr=MyDiff()
    endif
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg1 = substitute(arg1, '!', '\!', 'g')
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg2 = substitute(arg2, '!', '\!', 'g')
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let arg3 = substitute(arg3, '!', '\!', 'g')
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                if empty(&shellxquote)
                    let l:shxq_sav = ''
                    set shellxquote&
                endif
                let cmd = '"' . $VIMRUNTIME . '\diff"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        let cmd = substitute(cmd, '!', '\!', 'g')
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
        if exists('l:shxq_sav')
            let &shellxquote=l:shxq_sav
        endif
    endfunction

    "-------------------------------------------------------
    "                   Plugins Install
    "-------------------------------------------------------

    function! Base(dw1,dw2) abort
        echo 'Checando diretorios'
        "Caminho completo necessário
        "autoload
        let dir1 =  empty(glob(a:dw1))
        "bundle
        let dir2 =  empty(glob(a:dw2))


        "echo "Checando diretorios"
        let dir1 = empty(glob('C:\Program Files\Vim\vim82\autoload'))
        let dir2 = empty(glob('C:\Program Files\Vim\vim82\bundle'))


        if (dir1 || dir2)

            "criando diretorios  problema ao criar diretorio e privilegio
            if dir1
                :silent !mkdir "C:\Program Files\Vim\vim82\autoload"
                "echo "~/autoload criado"
            endif

            if dir2
                :silent !mkdir "C:\Program Files\Vim\vim82\bundle"
                "echo "~/bundle criado"
            endif


            silent exec 'cd' a:dw2
            "Option - 1) junegunn /vim-plug "
            silent exec "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

            "Option - 2) Pathogen tope/pathogem "
            "silent exec "!curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"

            "force redraw screen
            silent exec "redraw!"

        endif


    endfunction

endif
"------------------------------------End System config}}}"
"                   Global Stuff  {{{
"-------------------------------------------------------
""Set Inicial work-folder
if (has('win32') || has('win64'))
    :cd C:\Users\Bruno\Documents
endif

set ttyfast " Send more characters at a given time
"set ttymouse=xterm " Set mouse type to xterm
set undofile " Persistent Undoo
if !has('nvim')
    set viminfo=<500,:100,/50,%,'50,h,f0,s512
    set viminfo+=n~/.vim/.viminfo
else
""   Do nothing here to use the neovim default
""   or do soemething like:
   set viminfo+=n~/.vim/.shada
endif

set mouse=a " Enable mouse in all modes

set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll

" ignore these files while expanding wild chars
"
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg,*pdf
""set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set linebreak
set foldcolumn=4
set foldclose=all
set foldmethod=marker
" Don’t reset cursor to start of line when moving around.
set nostartofline
set cul             " underline active line
""set number          " show number
""set ruler           " show ruler cursor
""set relativenumber  " show relative relative line number
syntax on           " Switch on syntax highlighting.
syntax enable
set showmode        " Show the current mode
set showcmd         "Exibe comando sendo executado
set autowrite       " write buffers automagically when leaving them
""set vb              " set visual bell --
setlocal wildmode=full

"Word completion
"Complementação de palavras
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
set si "Smart indent
set lbr
set tw=500  " Linebreak on 500 characters
set showmatch
set textwidth=80
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
"filetype off                    "Vundle required if installed
""execute pathogen#infect()
filetype plugin indent on
filetype plugin on
filetype indent on

" - Avoid using standard Vim directory names like 'plugin'
""execute plug#begin()
call plug#begin('~/.vim/bundle')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Multiple commands
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
" Code to execute when the plugin is lazily loaded on demand
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" On-demand loading on both conditions
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
""unlet g:plug_url_format

" Multiple Plug commands can be written in a single line using | separators
""Plug 'tomtom/tlib_vim'

" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"Nerdtree icons(require Nerd Fonts)"
Plug 'ryanoasis/vim-devicons'
" tpope
""Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" DEOPLETE"
""Plug 'shougo/neocomplete'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Code Snnipets"

"coc - https://github.com/neoclide/coc.nvim
if has('nvim')
  " Use release branch (recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" YouCompleteMe"
""Plug 'ycm-core/youcompleteme'

" Problem with cmake have to install and point in path to newer version of cmake
" Problem when install/compile clang. was aborted
" Problem with legacy version of vim have to install this patch
" 3 problems, packages not found,sol cmd $python3 -m pip install --upgrade neovim/cmake/msgpack
" https://github.com/ycm-core/YouCompleteMe/issues/3764
if has('patch-8.1.2269')
" Latest YCM needs at least this version of vim
    Plug 'ycm-core/YouCompleteMe' 
else
" Version compatible with the vim in Debian 10 buster
    Plug 'ycm-core/YouCompleteMe', { 'commit':'d98f896' }
endif

" Multiple file types
"Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
"vim air-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"colorschemes
Plug 'altercation/vim-colors-solarized'

Plug 'dense-analysis/ale'

"code indent"
Plug 'Yggdroot/indentLine'

"emmet tags html
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'

"c/c++"
Plug 'vim-scripts/OmniCppComplete'
Plug 'vim-scripts/c.vim'

"Table Of Contents[toc]
Plug 'mzlogin/vim-markdown-toc'

"javascript
""Plug 'pangloss/vim-javascript'
""Plug 'jelera/vim-javascript-syntax'

let g:plug_url_format = 'git@github.com:%s.git'
"Myplugins
Plug 'brnfra/vim-short-html'
Plug 'brnfra/vim-short-cpp'
Plug 'brnfra/vim-markdown-brn'
unlet g:plug_url_format

" Unmanaged plugin (manually installed and updated)
""Plug '~/.vim/bundle/vim-short-cpp'
""Plug '~/.vim/bundle/ctags'

call plug#end()

"-------------------------------------------------------
"     END PLUGINS  }}}1
"             PLUGINS CONFIG {{{1
"              FUGITIVE                          {{{
"-------------------------------------------------------
if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif

"                                           }}}"
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
""let g:nerdtree_tabs_open_on_console_startup=0
""let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeTooggle = 1
"let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40
""au VimEnter * NERDTree | wincmd p    " open NERDTree automatically, focus on file buffer
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"Disable arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:NERDTreeMapUpdir = '<Left>'
let g:NERDTreeMapActivateNode = '<Right>'
let g:NERDTreeMapOpenSplit= '-'
let g:NERDTreeMapOpenVSplit= '+'
""nnoremap <F2> :NERDTreeTabsOpen<CR>
""nnoremap <F3> :NERDTreeTabsClose<CR>
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <esc>:NERDTreeToggle<CR>i
vnoremap <F2> <esc>:NERDTreeToggle<CR>


"---------------------------------END NERDTree }}}2
"               VIM-AIRLINE     {{{2
""--------------------------------------------------------
let g:airline_theme = 'base16'
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

set background=dark
if has('unix')
    silent! colorscheme solarized
    let g:solarized_termtrans=1
else
    silent!colorscheme base16-ateliercave
endif

if has('unix')
    if has('gui_running')
        set background=light
    else
        set background=dark
    endif
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

"" txt
augroup vimrc-wrapping
    autocmd!
    "autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

augroup END
set autoread

augroup auto_header
    autocmd!
    autocmd BufWritePre * silent! execute "normal ma"
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Arquivo\:.*/s//Arquivo\:"expand("%:t")
    "" autocmd BufWritePre * silent! exec "1," . 10 . "g/Arquivo\:*/s//Arquivo\:".expand("%:t")
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Autor\:.*/s//Autor\: Bruno Franco"
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Ultima_modificacao\:.*/s//Ultima_modificacao\: ".strftime("%d-%m-%Y")
    autocmd BufWritePre * silent! exec "1," . 10 . "g/Download\:.*/s//Download\: git\@github\.com\:brnfra"
    autocmd BufWritePost,FileWritePost * silent! execute "normal `a"

augroup END

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

" Arquivos .sh sao sempre bash, e não sh
"au FileType sh let b:is_bash=1
set shell=$SHELL\ -f

"autocmd vimenter * NERDTree
if !has('nvim')
    autocmd VimEnter * exec ":loadview"
endif
"-------------------------------------------END AUTCMD }}}
"                   SYNTAX Stuff        {{{

"-------------------------------------------------------

"au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" C/C++ specific settings
autocmd FileType c,cpp,cc set cindent

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
au BufRead,BufNewFile c set filetype=c

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
"---------------------------------------------------------------------------
"let mapleader="," " Map <Leader> to ,
" set leader to ;
let mapleader=";"

"-------------------------------------------END SYNTAX }}}
"                     COMPLETE MAPS     {{{
"-------------------------------------------------------
"Maps;
"<BAR>       - |
"<leader>    - ;
"<C-w>       - Ctrl + w
"<CR>        - Enter(confirma)
"<S-w>       - Shift + w
"<F1>        - F1

 " Ativa fechamento automático para parêntese
 " Set automatic expansion of parenthesis/brackets
 inoremap ( ()<left>
 inoremap { {}<left>
 inoremap [ []<left>
 inoremap ' ''<left>
 inoremap " ""<left>

" <F6> :setlocal spell! spelllang=pt_br<CR>
  noremap <F10> :q<cr>
  noremap <F9> :q!<cr>
  noremap <F8> :wall<cr>:mkview<cr>
  inoremap <F8> <esc>:w<CR>:mkview<cr>

if has ('unix')
        " Permite recarregar o vim para que modificações no
        " próprio vimrc seja ativadas com o mesmo sendo editado
        nnoremap 0v :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
        nnoremap 0V :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>:redraw!<cr>
        noremap =v :source ~/.vimrc<CR>:redraw!<cr>  " Para recarregar o .vimrc
        noremap =V :source ~/.vimrc<CR>:redraw!<cr>  " Para recarregar o .vimrc
        noremap ,v :e ~/.vimrc<CR>  " para editar o .vimrc
        noremap ,V :e ~/.vimrc<CR>  " para editar o .vimrc

  elseif (has('win32') || has('win64'))
      " Permite recarregar o vim para que modificações no
        " próprio vi<F10>mrc seja ativadas com o mesmo sendo editado
        nnoremap 0v :<C-u>source ~\_vimrc <BAR> echo "Vimrc recarregado!"<CR>
        nnoremap 0V :<C-u>source ~\_vimrc <BAR> echo "Vimrc recarregado!"<CR>
        noremap =v :source ~\_vimrc<CR>  " Para recarregar o .vimrc
        noremap =V :source ~\_vimrc<CR>  " Para recarregar o .vimrc
        noremap ,v :e ~\_vimrc<CR>  " para editar o .vimrc
        noremap ,V :e ~\_vimrc<CR>  " para editar o .vimrc

endif

 "--------------------------------------------------------
 ""                 Abbreviations
 "--------------------------------------------------------
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
if has('unix')
"Copy
vnoremap <C-c> :w !xclip -i -selection clipboard<CR><CR>

vnoremap y ""y<CR>
"Cut
vnoremap x ""x
"Paste
nnoremap p ""p<CR>

endif

"---------------------------------------------
"                   EDITING
"---------------------------------------------
"repeate line bellow
""inoremap <C-d> <esc>$v<Up>+yo<esc>pi
inoremap <C-d> <esc>$v0y$o<esc>p<up>$<esc>i
inoremap <C-T> <C-R><Tab>

nnoremap <C-r> :redo<cr>


noremap <F4> :Goyo 120x90%<CR>

noremap ,n :call Numshow()<CR>          " show number on/off""
function Numshow()
    let num = &number
    if !num
       set number
       set ruler
       set relativenumber
    else
       set nonumber
       set noruler
       set norelativenumber
    endif

endfunction

noremap ,s :call ShowBlanks()<CR>       " show blank spaces on/off"
function ShowBlanks()
    let lis = &list
    if !lis
        set list
    else
        set nolist
    endif
endfunction

noremap ,d :call DelBlanks()<CR>       " del blanck spaces"
function DelBlanks()
    :%s/\s\+$//

endfunction


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" inserir linhas e continuar em modo normal
noremap +l o<ESC>:echo<CR>
noremap +L O<ESC>:echo<CR>


" Mover linhas com: Ctrl+(seta abaixo) ou (seta acima)
" tem que estar em modo normal!
" Move Block down"
vnoremap <S-Down> VdjP`[v`]
" Move Block up"
vnoremap <S-Up> VdkP`[v`]

inoremap <S-Down> <esc>ddp<esc>
nnoremap <S-Down> <esc>ddp<esc>
inoremap <S-Up> <esc>ddkP<esc>
nnoremap <S-Up> <esc>ddkP<esc>

" terminal emulation
nnoremap <silent> <leader>l :terminal<CR>

" split window"
nnoremap <leader>/ :split<cr>
nnoremap <leader>- :vsplit<cr>

"" Switching windows buffer(NerdTree)

 nnoremap <C-Down> <C-W>j    "v
 nnoremap <C-Up> <C-W>k   "^
 nnoremap <C-Left> <C-W>h    "<
 nnoremap <C-Right> <C-W>l    ">
 nnoremap <Bar> <C-W>w

""nnoremap <S-Up> <C-w>w
 nnoremap <C-q> :close
 nnoremap <C-+> <C-w>+
 nnoremap <C--> <C-w>-

 "" Tabs
 nnoremap <Tab> gt
 nnoremap <S-Tab> gT
 nnoremap <S-t> :tabnew<CR>


"autocompletion document with ctrl+space
inoremap <c-space> <c-n>

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
"--------------------------------------------------------END MAPS  }}}
