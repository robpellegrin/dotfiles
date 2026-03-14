""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 03/14/2025
"
""

runtime config/settings.vim
runtime config/keymaps.vim
runtime config/statusline.vim
runtime config/functions.vim

" Set autocommands to call the function before saving
autocmd BufWritePre * call CleanWhitespace()
