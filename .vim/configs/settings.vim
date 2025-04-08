"====================================================================
" Arquivo: settings.vim
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
"
"====================================================================
"set nocompatible    " be iMproved, required
set shell=/bin/sh
set path+=**
set exrc
scriptencoding utf-8
set secure
set t_Co=256
set t_vb=
set ttyfast
set cot-=preview	"disable doc preview in omnicomplete
"                   Global Stuff  {{{
"-------------------------------------------------------
" ------------------------------------------------------------------------------------------------------------------------------
" Vim Directories
" ------------------------------------------------------------------------------------------------------------------------------
" Persistent Undoo
set undofile 
if !has('nvim')
    set viminfo='20,<50,s10,%,h,rv!,n~/.vim/backups/viminfo'
    " Local directories 
    set backupdir=~/.vim/backups/
    set directory=~/.vim/backups/swaps/
    set undodir=~/.vim/backups/undo/
    set viewdir=~/.vim/backups/view/
    let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~').'/.vim/backups') 
else
    " Local directories need to create
    set viminfo+=n~/.config/nvim/backups/.shada
    set backupdir=~/.config/nvim/backups/
    set directory=~/.config/nvim/backups/swaps/
    set undodir=~/.config/nvim/backups/undo/
    set viewdir=~/.config/nvim/backups/view/
    let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~').'/.config/nvim/backups') 

endif
""set nobackup                                                             
""set noswapfile                                                          
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp           
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp      
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp      
set viewdir=$DATA_PATH/view/                                       
set viewoptions=folds,cursor,curdir,slash,unix                    


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
"set 
"set softtabstop=-1
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
" --- sane text files -------   Encoding ----"
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1,cp936,gb18030
set encoding=utf-8
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
