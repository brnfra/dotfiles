"====================================================================
" Arquivo: plugins.vim
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
"     BEGIN PLUGINS INSTALL  {{{
"--------------------------------------------------------
"--AUTOCOMPLETION--
filetype on
filetype plugin indent on
call plug#begin('~/.vim/bundle')
Plug 'brnfra/vim-shortcuts'
"Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'hail2u/vim-css3-syntax'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vim-which-key'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'michal-h21/vim-zettel'
"Plug 'mzlogin/vim-markdown-toc'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease', {'on': []}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-scripts/OmniCppComplete'
"Plug 'vim-scripts/c.vim'
Plug 'vimwiki/vimwiki'
"Plug 'hecal3/vim-leader-guide'
Plug 'vim-scripts/bash-support.vim'
"Plug 'aliou/bats.vim'
Plug 'vim-scripts/bats.vim'
Plug 'StanAngeloff/php.vim'
" Syntax
Plug 'TysonAndre/php-vim-syntax'
Plug 'stephpy/vim-php-cs-fixer'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'roxma/vim-hug-neovim-rpc'
    "Plug 'roxma/nvim-yarp'
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

source ~/.vim/configs/plugins/coc.vim
source ~/.vim/configs/plugins/airline.vim
source ~/.vim/configs/plugins/nerdtree.vim
source ~/.vim/configs/plugins/vimwiki.vim
source ~/.vim/configs/plugins/vim-whitch-key.vim
source ~/.vim/configs/plugins/gutentags.vim
source ~/.vim/configs/plugins/ultisnips.vim

"                 ALE.VIM  {{{2
"-------------------------------------------------------
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_autoimport = 1
"-----------------------------------END ALE.VIM}}}2
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
if shownetrw
    let g:netrw_menu=1
    let g:netrw_preview=1
    let g:netrw_browse_split=2
endif
function! NetrwOnBufferOpen()
    if exists('b:noNetrw')
	return
    endif
    call ToggleNetrw()
endfun

""-----------------------------------------END NETRW }}}2
"              COLORSCHEME {{{2
""------------------------------------------------------
" vim-shortcuts define final colors
set background=light
if has('unix')
    if has("gui_running")
	set background=dark
	colorscheme desert
    else
	colorscheme papayadroid

    endif
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
"		UltiSnips	{{{2
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']
"		}}}2
"
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

"               END PLUGINS CONFIG"}}}1
