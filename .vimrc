syntax on

colorscheme solarized
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set backspace=indent,eol,start
set laststatus=2
set autoindent
set smartindent
set cursorline
set listchars=tab:▸\ ,eol:¬,trail:⋅
set list
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","

" ---------- Plugins

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'zirrostig/vim-schlepp'
Plug 'Valloric/YouCompleteMe'
Plug 'kchmck/vim-coffee-script'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-airline-colornum'

call plug#end()

" ---------- Mappings 
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>x :x<CR>
nmap <silent> <leader>q :q!<CR>
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>n :bn<CR>
nmap <silent> <leader>p :bp<CR>
nmap <silent> <leader>p :bp<CR>
nmap <silent> <leader>r :CtrlPBuffer<CR>
nmap <Enter> o<ESC>
" Prevent moving cursor to left while ESC pressing
inoremap <Esc> <Esc>`^

let g:ctrlp_map='<leader>e'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Indentation
vmap <S-Tab> <gv
vmap <Tab> >gv
nmap <S-Tab> <<
nmap <Tab> >>

let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Turns on/off the expansion of <CR>
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1

" Custom tabwidth for coffeescript files
au FileType coffee setl ts=2 sw=2 et
