syntax on

colorscheme zenburn
set clipboard=unnamed
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set backspace=indent,eol,start
set laststatus=2
set autoindent
set smartindent
set cursorline
set listchars=tab:▸\ ,trail:⋅
set paste
set list

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
let g:closetag_html_style=1
let g:NERDTreeWinSize=40

" ---------- Plugins

call plug#begin('~/.vim/plugged')

" Code plugins
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'wavded/vim-stylus'

" Interface plugins, utils, etc
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-airline-colornum'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'docunext/closetag.vim'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fireplace'

call plug#end()

" ---------- Mappings 
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>x :x<CR>
nmap <silent> <leader>s :w<CR>
nmap <silent> <leader>q :q!<CR>
nmap <silent> <leader>w :bw<CR>
nmap <silent> <leader>n :bn<CR>
nmap <silent> <leader>p :bp<CR>
nmap <silent> <leader>j gf<CR>
nmap <silent> <leader>m :CtrlPMixed<CR>
nmap <silent> <leader>r :CtrlPBuffer<CR>
nmap <Enter> o<ESC>
nmap Ò mzgg=G`z 

" Prevent moving cursor to left while pressing ESC
inoremap <Esc> <Esc>`^

" Moving line
nnoremap Ô :m .+1<CR>==
nnoremap  :m .-2<CR>==

inoremap Ô <Esc>:m .+1<CR>==gi
inoremap  <Esc>:m .-2<CR>==gi

vnoremap Ô :m '>+1<CR>gv=gv
vnoremap  :m '<-2<CR>gv=gv

let g:ctrlp_map='<leader>e'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Indentation
vmap <S-Tab> <gv
vmap <Tab> >gv
nmap <S-Tab> <<
nmap <Tab> >>

let g:airline_theme = 'bubblegum'
" let g:airline_left_sep=''
" let g:airline_right_sep=''

" Turns on/off the expansion of <CR>
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1

" Custom tabwidth for coffeescript files
au FileType coffee setl ts=2 sw=2 et
au FileType stylus setl ts=2 sw=2 et

" Set javascript syntax in jsp files by default
au BufRead,BufNewFile *.jsp set syntax=javascript
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
