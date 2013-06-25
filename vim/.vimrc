set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'

" Status bar
set statusline=%<\ %f\ %y[%{&ff}][%{strlen(&fenc)?&fenc:'none'}]%m%r%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ %)

" Encoding
if has('multi_byte')
  set fileencodings=utf-8,big5
if v:lang =~ '^zh_TW'
  set encoding=big5
  set termencoding=big5
  set fileencoding=big5
endif
if v:lang =~ 'utf8$' || v:lang =~ 'UTF-8$'
  set encoding=utf-8
  set termencoding=utf-8
  set fileencoding=utf-8
endif
else
  echoerr 'Sorry, this version of (g)vim was not compiled with multi_byte.'
endif
set nobomb

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
