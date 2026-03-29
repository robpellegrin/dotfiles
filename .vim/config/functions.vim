""
" @file:    .vimrc
" @author:  Rob Pellegrin
" @updated: 03/14/2025
"
""

" Strips trailing whitespace from the current buffer.
function! CleanWhitespace()
    " Store current cursor position
    let l:cur_pos = getpos(".")

    " Remove trailing whitespace
    silent! %s/\s\+$//ge

    " Remove whitespace from empty lines
    silent! %s/\($\n\s*\)\+\%$//

    " Restore cursor position
    call setpos('.', l:cur_pos)
endfunction


" Inserts a Python header docstring.
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
    let header .= '@file:    ' . expand('%:t') . "\n"
    let header .= '@author:  ' . "Rob Pellegrin" . "\n"
    let header .= '@date:    ' . strftime("%m-%d-%Y") . "\n"
    let header .= "\n"
    let header .= '@updated: ' . strftime("%m-%d-%Y") . "\n"
    let header .= "\n"
    let header .= '"""' . "\n"

    " Insert at top of file
    call append(0, split(header, "\n"))
endfunction

" Toggle cursor between first non-whitespace character and start of the line
let s:toggle = 0

function! ToggleHome()
  " Check if toggle state is 0 (first press), move to first non-whitespace char
  if s:toggle == 0
    normal! ^
    let s:toggle = 1
  " If already at first non-whitespace character, toggle to start of the line
  elseif s:toggle == 1
    normal! 0
    let s:toggle = 0
  endif
endfunction

" Map the function to the Home key (or any key of your choice)
nnoremap - :call ToggleHome()<CR>
