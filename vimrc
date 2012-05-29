syntax on
filetype off

" setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-ragtag'
Bundle 'othree/html5.vim'
Bundle 'itfrombit/nuvim'
Bundle 'jpalardy/vim-slime'
Bundle 'vim-scripts/VimClojure'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

"
" Brief help for Vundle
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on

" kill the gui toolbar
if has("gui_running")
    set guioptions=egmrt
endif

set nocompatible " bye vi

" auto read when a file is changed externally
set autoread

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch
set gdefault "default to global substitution
"easily cancel out of search
nnoremap <leader><space> :noh<cr>

" backup off, unnecessary with git
set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

set ai "Auto indent
set si "Smart indent

" correctly handle long lines
set wrap "Wrap Lines
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬ "show tab and eol characters

" general sanity from steve losh
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile "maintain undofile between edits

let mapleader = ","

" map is recursive, (n/v)map = normal/visual map
" noremap = non-recursive map
" v works in visual and select, x = visual only

" sane movement between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" move by file lines, not screen lines
nnoremap j gj
nnoremap k gk

nnoremap ; :
inoremap jj <ESC>

" strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" edit vimrc, auto reload on edit
nnoremap <leader>E <C-w><C-v><C-l>:e $MYVIMRC<CR>
autocmd! BufWritePost vimrc source $MYVIMRC

nnoremap <leader>w <C-w>v<C-w>l "new vertical window

nnoremap <leader>v V`] "reselect the text last pasted

au FocusLost * :wa "save on focus lost

" Auto-compile coffeescript
" autocmd BufWritePost,FileWritePost *.coffee :silent !coffee -c <afile>

" and stylus
" autocmd BufWritePost,FileWritePost *.styl :silent !stylus -c <afile>

" Put yankring history file in .vim folder
let g:yankring_history_dir = '~/.vim/'

" let g:user_zen_expandabbr_key = '<c-e>'

map <leader>p :Mm<CR>

set background=dark
colorscheme solarized
" trying inconsolata, really like Menlo though
set gfn=Inconsolata:h13

au BufNewFile,BufRead *.nu,*.nujson,Nukefile    setf nu

autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
