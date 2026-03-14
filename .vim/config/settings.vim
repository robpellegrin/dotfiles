""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 03/14/2025
"
""

colorscheme github_dark

" Disable highlighting matching parens.
let g:loaded_matchparen=1

" Disable compatibility with vi
set nocompatible

" Enable type file detection.
filetype on

" Enable plugins and load plugin for detected file type.
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

" Turn on syntax highlighting
syntax on

" Keep swap files in one directory
set directory=~/.vim/swap

" Enable persistent undo
set undofile
set undodir=~/.vim/undo
set undolevels=1024

" Enable backups
set backup
set backupdir=~/.vim/backup


set autoindent
set autoread
au CursorHold * checktime
set number

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set listchars=trail:·


