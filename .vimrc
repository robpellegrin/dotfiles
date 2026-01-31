""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 1/31/2025
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

" Set fold method to indent for Python
autocmd FileType python setlocal foldmethod=indent

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

highlight StatusLine  ctermfg=7 ctermbg=1 guifg=red guibg=white

""
" Keyboard Shortcuts
""

let mapleader = " "

" Tab toggles folding
nnoremap <Tab> za

nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>H :set list!<CR>
nnoremap <leader><Tab> gt
nnoremap <C-w>t :tabnew<CR>

nnoremap - ^
vnoremap - ^
nnoremap = $
vnoremap = $

" Move selected lines up/down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap <leader>h ^
vnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>l $

inoremap jj <Esc>

" Save with Ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Exit and discard with Ctrl+x
nnoremap <C-x> :qa!<CR>
inoremap <C-x> <Esc>:qa!<CR>a
vnoremap <C-x> <Esc>:qa!<CR>gv

nnoremap <leader>cf :%!clang-format<CR>

