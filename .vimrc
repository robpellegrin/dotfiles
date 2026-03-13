""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 03/11/2025
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

" Show opened file in statusline
set laststatus=2

set autoindent
set autoread
au CursorHold * checktime
set number

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set listchars=trail:·

" Set fold method to indent for Python
"autocmd FileType python setlocal foldmethod=indent

""
" Configure status line
""

set statusline=    " Prevents issues when re-sourcing within Vim.
set statusline+=%F " Full path to opened file
set statusline+=%m " Show modified marker
set statusline+=%r " Show read-only marker

" Right-align the following items
set statusline+=%=

set statusline+=%c       " Show column number
set statusline+=\ \      " Insert a space
set statusline+=\[%l/%L] " Current line/Total lines
set statusline+=\ \      " Insert a space
set statusline+=%p%%     " Percentage through file
set statusline+=\ \      " Insert a space

"set statusline+=%y " Show detected filetype

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
nnoremap sp :set spell!<CR>

inoremap jj <Esc>

" Save with Ctrl+s
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Exit and discard with Ctrl+q
inoremap <C-q> <Esc>:qa!<CR>a
nnoremap <C-q> :qa!<CR>
vnoremap <C-q> <Esc>:qa!<CR>gv

" Map InsertFileHeader() to F5 in normal mode
nnoremap <F5> :call InsertFileHeader()<CR>

"nnoremap <leader>cf :%!clang-format<CR>

function! CleanWhitespace()
    " Store current cursor position
    let l:cur_pos = getpos(".")
    " Remove trailing whitespace
    silent! %s/\s\+$//ge
    " Remove whitespace from empty lines
    silent! %s/^\n+//ge
    " Restore cursor position
    call setpos('.', l:cur_pos)
endfunction

" Set autocommands to call the function before saving
autocmd BufWritePre * call CleanWhitespace()

" Function to insert Python file header docstring
function! InsertFileHeader()
    " Only apply to Python files
    if &filetype !=# 'python' && expand('%:e') !=# 'py'
        echo "Not a Python file — header not inserted."
        return
    endif

    " Only insert if the first line is empty
    if getline(1) !=# ''
        echo "Top of file not empty — header not inserted."
        return
    endif

    " Build header docstring
    let header = '"""' . "\n"
    let header .= '@file    ' . expand('%:t') . "\n"
    let header .= '@author  ' . "Rob Pellegrin" . "\n"
    let header .= '@date    ' . strftime("%m-%d-%Y") . "\n"
    let header .= "\n"
    let header .= '@updated ' . strftime("%m-%d-%Y") . "\n"
    let header .= "\n"
    let header .= '"""' . "\n"

    " Insert at top of file
    call append(0, split(header, "\n"))

    " Move cursor inside the @brief line
    call cursor(5, 0) " line 3 is @brief
endfunction

function! UpdateFileHeader()
    " Only apply to Python files
    if &filetype !=# 'python' && expand('%:e') !=# 'py'
        return
    endif
	
	" Only update header if file has been modified.
	if !&modified
		return
	endif

    " Read the current file content
    let l:lines = getline(1, '$')
    let l:updated_found = 0
	let l:line_number = 0
	
	let l:current_date = strftime('%m/%d/%Y')

    for l:line_number in range(1, len(l:lines))
		let l:line - l:lines[l:line_number - 1]
		
        " Check for the @updated line
        if l:line =~ '@updated'
            " Build the new updated line
            let l:updated_line = substitute(l:line, '\(@updated:\s*\).*', '@updated ' . current_date, ''))
            let l:updated_found = 1
            break
        endif
    endfor

    " If @updated line was found, replace it
    if l:updated_found
        " Replace the old line with the new updated line 
        call setline(l:line_number, l:updated_line)
    else
        echo "No @updated line found in the file."
    endif
endfunction

" Auto call UpdateFileHeader when saving a Python file
autocmd BufWritePre *.py call UpdateFileHeader()

