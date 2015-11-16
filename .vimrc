" General " ~~~~~~~~~~~~~~~~ syntax on
colorscheme github

let mapleader = ","
let g:mapleader = ","
set clipboard=unnamed
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set hidden

set backspace=indent,eol,start
set laststatus=2

set number
set autoindent
set smartindent
set cursorline

set listchars=tab:▸\ ,trail:⋅
set list

set incsearch
set ignorecase
set hlsearch
" set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on

" Plugins
" ~~~~~~~~~~~~~~~~
call plug#begin('~/.vim/plugged')

" Code plugins
" ~~~~~~~~~~~~~~~~

" stylus
Plug 'wavded/vim-stylus'

" javascript
Plug 'pangloss/vim-javascript'

" coffee
Plug 'kchmck/vim-coffee-script'

" clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'

" Interface plugins, utils, etc
" ~~~~~~~~~~~~~~~~

" navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" editing
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'docunext/closetag.vim'

" ui
Plug 'ntpeters/vim-airline-colornum'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'

call plug#end()

" Mappings
" ~~~~~~~~~~~~~~~~

nmap <silent> <leader>x :x<cr>
nmap <silent> <leader>s :w<cr>
nmap <silent> <leader>q :q<cr>

nmap <silent> <leader>t :NERDTreeToggle<cr>

nmap <silent> <leader>m :CtrlPMRUFiles<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>

" Vim firplace mappings
nmap <silent> <leader>j gf<cr>
nmap <silent> <s-e> :Eval<cr>

" buffers
noremap <silent> <c-l> :bn!<cr>
noremap <silent> <c-h> :bp!<cr>

nmap <Enter> o<ESC>
nmap Ò mzgg=G`z 
noremap <silent> ; :nohlsearch<CR>

imap <c-@> <c-space>

" Moving line
nnoremap Ô :m .+1<cr>==
nnoremap  :m .-2<cr>== inoremap Ô <Esc>:m .+1<cr>==gi
inoremap  <Esc>:m .-2<cr>==gi

vnoremap Ô :m '>+1<cr>gv=gv
vnoremap  :m '<-2<cr>gv=gv

let g:closetag_html_style=1
let g:NERDTreeWinSize=40

" let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabCrMapping=1

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

let g:ctrlp_map='<leader>e'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Indentation
vmap <S-Tab> <gv
vmap <Tab> >gv
nmap <S-Tab> <<
nmap <Tab> >>

let g:airline_theme = 'sol'

" Turns on/off the expansion of <CR>
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1

" Custom tabwidth for coffeescript files
au FileType coffee setl ts=2 sw=2 et
au FileType stylus setl ts=2 sw=2 et

" Set javascript syntax in jsp files by default
au BufRead,BufNewFile *.jsp set syntax=javascript
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
