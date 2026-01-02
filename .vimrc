""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 1/2/2025
"
""

colorscheme slate

" Disable swapfile
set noswapfile

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

" Show opened file in statusline
set laststatus=2

set number
set autoindent
set autoread
"set cursorline

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set listchars=trail:·


""
" Configure status line
""

set statusline+=%F " Full path to opened file
set statusline+=%m " Show modified marker
set statusline+=%r " Show read-only marker

" Right-align the following items
set statusline+=%=

set statusline+=\[%l/%L] " Current line/Total lines
set statusline+=\ \ " Insert whitespace
set statusline+=%p%% " Show percentage through the opened file
"set statusline+=%y " Show detected filetype

highlight StatusLine  ctermfg=1 ctermbg=7 guifg=white guibg=red


""
" Keyboard Shortcuts
""

let mapleader = " "

nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>H :set list!<CR>
nnoremap <leader><Tab> gt
nnoremap <C-w>t :tabnew<CR>

nnoremap - ^
nnoremap = $
vnoremap - ^
vnoremap = $

inoremap jj <Esc>

" Save with Ctrl+s
nnoremap <C-s> :wq<CR>
inoremap <C-s> <Esc>:wq<CR>
vnoremap <C-s> <Esc>:wq<CR>

" Save with Ctrl+w
nnoremap <leader><C-w> :w<CR>
inoremap <C-w> <Esc>:w<CR>
vnoremap <C-w> <Esc>:w<CR>

" Exit and discard with Ctrl+x
nnoremap <C-x> :qa!<CR>
inoremap <C-x> <Esc>:qa!<CR>a
vnoremap <C-x> <Esc>:qa!<CR>gv

nnoremap <leader>cf :%!clang-format<CR>

