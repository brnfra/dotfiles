
"====================================================================
" Arquivo: airline.vim
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
"               VIM-AIRLINE     
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
fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfun
