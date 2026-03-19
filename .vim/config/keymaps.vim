""
" @file:    .keymaps.vim
" @author:  Rob Pellegrin
" @updated: 03/16/2025
"
" Vim keyboard shortcuts
"
""

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
nnoremap sp :set spell!<CR>

inoremap jj <Esc>

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

" Toggle Explore with ctrl+n
nnoremap <C-n> <Esc>:Rexplore<CR>

"nnoremap <leader>cf :%!clang-format<CR>
nnoremap <leader>r :terminal python3 %<CR>
