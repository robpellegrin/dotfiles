""
" @file:    .keymaps.vim
" @author:  Rob Pellegrin
" @updated: 04/10/2025
"
" Vim keyboard shortcuts
"
""

let mapleader = " "

" Toggle folding with spacebar
nnoremap <Space> za

" Ignore case when searching
set ignorecase smartcase

" Search and highlight while typing
set incsearch

nnoremap <C-w>t :tabnew<CR>
nnoremap <leader><Tab> gt
nnoremap <leader><Backspace> gT
nnoremap <leader>H :set list!<CR>
nnoremap <leader>h :nohlsearch<CR>

" Make `=` behave like `$`
nnoremap = $
vnoremap = $

" Move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

xnoremap <leader>s :sort<CR>
nnoremap sp :set spell!<CR>

inoremap jj <Esc>

" Resize splits
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Save with Ctrl+s
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> <Esc>:w<CR>
nnoremap <C-n> :Explore<CR>

" Exit with Ctrl+q
inoremap <C-q> <Esc>:q<CR>a
nnoremap <C-q> :q<CR>
vnoremap <C-q> <Esc>:q<CR>gv

" Exit with Ctrl+q
inoremap <leader><C-q> <Esc>:q!<CR>a
nnoremap <leader><C-q> :q!<CR>
vnoremap <leader><C-q> <Esc>:q!<CR>gv

" Map InsertFileHeader() to F5 in normal mode
nnoremap <F5> :call InsertFileHeader()<CR>

" nnoremap <leader>cf :%!clang-format<CR>
nnoremap <leader><C-r> :terminal python3 %<CR>
