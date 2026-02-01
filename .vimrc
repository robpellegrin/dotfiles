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
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Show opened file in statusline
set laststatus=2

set autoindent
set autoread
"set cursorline
set number

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

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

set statusline+=%p%% " Show percentage through the opened file
"set statusline+=%y " Show detected filetype
set statusline+=\ \ " Insert whitespace
set statusline+=\[%l/%L] " Current line/Total lines

highlight StatusLine  ctermfg=7 ctermbg=1 guifg=red guibg=white

""
" Keyboard Shortcuts
""

let mapleader = " "

" Tab toggles folding
nnoremap <Tab> za

nnoremap <C-w>t :tabnew<CR>
nnoremap <leader><Tab> gt
nnoremap <leader>H :set list!<CR>
nnoremap <leader>h :nohlsearch<CR>

nnoremap - ^
nnoremap = $
vnoremap - ^
vnoremap = $

" Move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>h ^
vnoremap <leader>l $

xnoremap <leader>s :sort<CR>

inoremap jj <Esc>

" Save with Ctrl+s
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Exit and discard with Ctrl+x
inoremap <C-q> <Esc>:qa!<CR>a
nnoremap <C-q> :qa!<CR>
vnoremap <C-q> <Esc>:qa!<CR>gv

"nnoremap <leader>cf :%!clang-format<CR>

