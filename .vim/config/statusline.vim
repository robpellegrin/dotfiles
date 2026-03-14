""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 03/14/2025
"
" Vim status line config.
"
""

" Show opened file in statusline
set laststatus=2

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
