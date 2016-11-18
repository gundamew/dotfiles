set nocompatible                             " First, turn off Vi compatibility mode

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
call plug#end()

" vim-airline
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''

syntax on                                    " Enable syntax highlighting
set background=dark                          " Do better syntax highlighting
set t_Co=256                                 " Make Vim use 256 colors

set number                                   " Print the line number in front of each line
highlight LineNr ctermfg=15 ctermbg=8        " Change the color used for the line number
set nowrap                                   " Lines will not wrap
set showmatch                                " Show matching brackets
set mouse=a                                  " Enable mouse usage (all modes)

set list                                     " Open list mode
set listchars=tab:>-,trail:･,eol:$,nbsp:･    " Replace tab, trailing spaces, end-of-line, and non-breakable spaces with symbols
highlight NonText ctermfg=245                " Show invisible characters
highlight SpecialKey ctermfg=245             " As above

set tabstop=2                                " Read tab as 2 spaces
set shiftwidth=2                             " Using 2 spaces for each step of (auto)indent
set softtabstop=2                            " Inserting a tab using 2 spaces
set smartindent                              " Do smart autoindenting when starting a new line
set expandtab                                " Replace tab with spaces

set incsearch                                " Incremental search
set hlsearch                                 " Highlight all matches

set laststatus=2                             " Displaying status line always

set fileformat=unix                          " Set the end-of-line to Unix style
set fileformats=unix,dos,mac                 " Automatic end-of-line detection order

set nobackup                                 " Do not backup
set nowritebackup                            " Do not write backup
set noswapfile                               " Do not use swapfile

set backspace=indent,eol,start               " Allow the backspace/delete key to behave normally
set colorcolumn=80                           " Setup a line length marker
