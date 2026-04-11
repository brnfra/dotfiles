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
"Plug 'hail2u/vim-css3-syntax'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vim-which-key' 
"Plug 'michal-h21/vim-zettel'
"Plug 'mzlogin/vim-markdown-toc'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-scripts/OmniCppComplete'
"Plug 'vim-scripts/c.vim'
Plug 'vimwiki/vimwiki' 
"Plug 'hecal3/vim-leader-guide'
"Plug 'vim-scripts/bash-support.vim'
"Plug 'aliou/bats.vim'
"Plug 'vim-scripts/bats.vim'
" DEOPLETE"
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
"    function! CheckBackspace() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1]  =~ '\s'
"    endfunction

   " inoremap <silent><expr><TAB>
"		\ CheckBackspace() ? "\<TAB>" :
"		\ coc#pum#visible() ? coc#pum#next(1) :
"		\ coc#refresh()

    
    inoremap <expr><TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#next(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    "inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
    "                          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
   
    " Use <c-space> to trigger completion.
    if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
    else
	inoremap <silent><expr> <c-@> coc#refresh()
    endif
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
    "nmap <leader>rn <Plug>(coc-rename)
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
"             VIM-WITCH-KEY {{{
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
"let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default (this is the string toggled by netrw-gh)
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
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
" vim-shortcuts define final colors	
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
