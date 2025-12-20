colorscheme slate

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

set number
set autoindent
set cursorline
" set cursorcolumn

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

let mapleader = " "

" Keyboard Shortcuts

nnoremap <leader>S :sp<CR>
nnoremap <leader>V :vsp<CR>
nnoremap <leader>C :close<CR>

nnoremap - ^
nnoremap = $
inoremap - ^
inoremap = $
vnoremap - ^
vnoremap = $

inoremap jj <Esc>

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Exit and discard with Ctrl+X
nnoremap <C-x> :qa!<CR>
inoremap <C-x> <Esc>:qa!<CR>a
vnoremap <C-x> <Esc>:qa!<CR>gv

