syntax on
set ruler
set number
set autoindent
set smartindent

" Editor settings
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2

filetype plugin indent on
filetype plugin on

set wrap
set linebreak
set nocompatible
set mouse+=a

set splitright

" Theme set up
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark
colorscheme gruvbox

let g:airline_theme='one'
let g:rainbow_active = 1
