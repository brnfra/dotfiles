"====================================================================
" Arquivo: mappings.vim
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
"                     COMPLETE MAPS     {{{
"-------------------------------------------------------

"--------------------------------------------------------
""                 Abbreviations
"--------------------------------------------------------
"
" Tip #382: Search for <cword> and replace with input() in all open buffers
let mapleader="," "Map <Leader> to \
let g:mapleader=","

noremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>s :wall<cr>:mkview<cr>
nnoremap <leader>S :wall<cr>:mkview<cr>
inoremap <leader>s <esc><esc>:w<CR>:mkview<cr>
inoremap <leader>S <esc><esc>:w<CR>:mkview<cr>

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
"
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
inoremap <M-BS> <Esc><Right>dbi
inoremap <M-z>  <Esc>0i
inoremap <M-x>  <Esc>$i<Right>
inoremap <M-a>  <S-Left>
inoremap <M-s>  <S-Right>
inoremap <M-Down>  <Esc>5<Down>i<Right>
inoremap <M-Up>    <Esc>5<Up>i<Right>
inoremap <M-Left>  <Esc>5bi<Right>
inoremap <M-Right> <Esc>5wi<Right>

inoremap <C-k> <Esc>ld$i

nnoremap <M-Up>    <Esc>5<Up>i<Right>

" move updown by visual (wrapped) lines
noremap j gj
noremap k gk

inoremap <c-g> <esc>
"vim-shortcuts
vnoremap <silent> <S-C> :call SurroundQuotes()<CR>
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
if has('+clipboard')
  set pastetoggle=<F6>
endif
""vim-shortcuts
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
"move line
nnoremap <S-Up> :m .-2<CR>
nnoremap <S-Down> :m  .+1<CR>
inoremap <S-Down> <esc>:m  .+1<CR>
inoremap <S-Up> <esc>:m .-2<CR>
"inoremap <S-down> <esc>ddp<esc>i
"nnoremap <S-down> <esc>ddp<esc>
"inoremap <S-up> <esc>ddkP<esc>i
"nnoremap <S-up> <esc>ddkP<esc>
"move insert mode
inoremap <C-up> <esc>5ki
inoremap <C-down> <esc>5ji
inoremap <C-left> <esc>hbi
inoremap <C-right> <esc>lwi
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)
"conflict editing command
"inoremap <S-down> <esc>ddp<esc>i
"nnoremap <S-down> <esc>ddp<esc>
"inoremap <S-up> <esc>ddkP<esc>i
"nnoremap <S-up> <esc>ddkP<esc>

" terminal emulation
nnoremap <leader>l :terminal<CR>
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
"-------------------------------------------------------END MAPS
