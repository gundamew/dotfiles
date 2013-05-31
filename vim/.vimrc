set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'

" Status bar
set statusline=%<\ %f\ %y[%{&ff}][%{strlen(&fenc)?&fenc:'none'}]%m%r%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ %)

" Indent
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Search
set showmatch
set incsearch
set hlsearch
set ignorecase

" Color
syntax on
set number
set background=dark
colorscheme solarized

" Nerdtree
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinSize=25
let NERDTreeWinPos="left"
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
