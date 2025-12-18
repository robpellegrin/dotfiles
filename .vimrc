" Disable compatibility with vi 
set nocompatible

" Enable type file detection.
filetype on

" Enable plugins and load plugin for detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn on syntax highlighting
syntax on

" Add numbers to each line on the left-hand side.
set number

set cursorline
" set cursorcolumn

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set fillchars=eob:\

nnoremap - ^
nnoremap = $

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv

" Exit and discard with Ctrl+X
nnoremap <C-x> :qa!<CR>
inoremap <C-x> <Esc>:qa!<CR>a
vnoremap <C-x> <Esc>:qa!<CR>gv

