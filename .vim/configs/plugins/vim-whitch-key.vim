"====================================================================
" Arquivo: vim-whitch-key.vim
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
"             VIM-WITCH-KEY 
"=================================================================================================================================
" Which Key Map  settings
"=================================================================================================================================
" Define prefix dictionary
let g:lmap =  {}
let g:which_key_map = {}
let g:which_key_map.b = {}
let g:which_key_map.c = {}
let g:which_key_map.p = {}
let g:which_key_map.w = {}

if !exists('which_key#register')
"    silent! call which_key#register('\', 'g:which_key_map')
    call which_key#register('\', 'g:which_key_map')

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

" By default timeoutlen is 1000 ms, commands using leader
set timeoutlen=300
let g:which_key_map = {
	    \ 'name'	: '+General commands',
	    \ '\'       : [ ''                                               , 'Search <++> and enter'       ] ,
	    \ 'D'       : [ ',DD'                                           , 'Delete break lines'          ] ,
	    \ 'd'       : [ ',D'                                            , 'Delete blank lines'          ] ,
	    \ 'h'       : [ ',d'                                            , 'Delete spaces in the end'    ] ,
	    \ 'V'       : [ '=v'                                             , 'Redraw vimrc'                ] ,
	    \ 'v'       : [ '0v'                                             , 'Reload Vimrc '               ] ,
	    \ 'e'       : [ ':e $MYVIMRC'                                    , 'Edit Vimrc '                 ] ,
	    \ 'r'       : [ ':call Replace()'                                , 'Replace() word'            ] ,
	    \ '1'       : [ ':call SurroundQuotes()'                         , 'SurroundQuotes()'         ] ,
	    \ '2'       : [ '<C-F12>'                                        , 'ctags -R           '         ] ,
	    \ 'C'       : [ '<C-C>'                                          , 'Copy to xclip (visual)'      ] ,
	    \ 's'       : [ ':s'                                          , 'Save current file  '         ] ,
	    \ 'q'       : [ ':q'                                          , 'Exit vim           '         ] ,
	    \ 'L'       : [ '+L'                                             , 'Add a line before'           ] ,
	    \ }

let g:which_key_map.k = {
	    \ 'name'	: '+Keyboard +F +commands',
	    \
	    \ '<F1>'    : [ ''                                               , 'Help'             ] ,
	    \ '<F2>'    : [ ''                                               , 'Toggle NERDTree'             ] ,
	    \ '<F3>'    : [ ''                                               , 'Toggle Number'               ] ,
	    \ '<F4>'    : [ ''                                               , 'AutoIndent'                  ] ,
	    \ '<F5>'    : [ ''                                               , 'Wrap Lines'                  ] ,
	    \ '<F6>'    : [ ''                                               , 'Toggle Paste'                ] ,
	    \ '<F7>'    : [ ''                                               , 'Toggle Fold'                 ] ,
	    \ '<F8>'    : [ ''                                               , 'Turn OneLine All'            ] ,
	    \ '<F9>'    : [ ''                                               , 'Toggle Local BreakIndent'    ] ,
	    \ '<F10>'    : [ ''                                               , 'No set'    ] ,
	    \ '<F11>'    : [ ''                                               , 'No set'    ] ,
	    \ '<F12>'    : [ ''                                               , 'No set'    ] ,
	    \ 
	    \ }
let g:which_key_map.c = {
	    \ 'name'    : '+Man_Page',
	    \
	    \ '1'   : [ ',K'                                                , 'Get Man page 1'              ] ,
	    \ '2'   : [ ',M'                                                , 'Get Man Page 2'              ] ,
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
	    \ "w"    : [':VimwikiIndex'                                , 'Go To Index'                           ] ,
	    \ "n"    : [':VimwikiMakeDiaryNote'                        , 'Create new wiki page'                  ] ,
	    \ "D"    : [':VimwikiDeleteFile'                           , 'Delete wiki page'                      ] ,
	    \ "r"    : [':VimwikiRenameFile'                           , 'Rename wiki page'                      ] ,
	    \ "c"    : [':VimwikiCheckLinks'                           , 'Check links'                      ] ,
	    \ "s"    : [':VimwikiSearch '                              , 'Search /pattern/'                      ] ,
	    \ "S"    : [':VimwikiSearchTags'                           , 'Search-for-wiki-TAGS'                  ] ,
	    \ 'o'    : [ '\w\m'                                       , 'Make Tomorrow Diary Note'              ] ,
	    \ 'y'    : [ '\w\y'                                       , 'Make Yesterday Diary Note'             ] ,
	    \ '3'    : [ '\w\t'                                       , 'Tab Make Diary Note'                   ] ,
	    \ 'd'    : [ '\w\w'                                       , 'Make Diary Note'                       ] ,
	    \ 'l'    : [ '\w\i'                                       , 'Diary Generate Links'                  ] ,
	    \ 'I'    : [ '\wi'                                        , 'Diary Index'                           ] ,
	    \ '7'    : [ '\ws'                                        , 'UI Select'                             ] ,
	    \ 'x'    : [ '\wt'                                        , 'Tab Index'                             ] ,
	    \ '-'    : [ '<C-M>'                                      , 'Diary Prev Day'                        ] ,
	    \ '+'    : [ '<C-N>'                                      , 'Diary Next Day'                        ] ,
	    \ '<Tab>': [ '<C-Tab>'                                    , 'Prev Link'                             ] ,
	    \ '0'    : [ '<C-[>'                                      , 'Table Next Cell'                       ] ,
	    \ '9'    : [ '<C-]>'                                      , 'Table Prev Cell'                       ] ,
	    \
	    \ 'b'    : {
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
	    \ "h"    : ['VimwikiTableMoveColumnLeft'                  , 'Move current column to the left'          ] ,
	    \ "l"    : ['VimwikiTableMoveColumnRight'                 , 'Move current column to the Right'         ] ,
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

"              
