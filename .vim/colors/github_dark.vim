" GitHub Dark (palette-driven) for Vim 9
" Uses user-provided github color palette
" No plugins, no Neovim features

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "github_dark"

set termguicolors

" ---------------------------------------------------------------------
" Palette
" ---------------------------------------------------------------------
let s:c = {
  \ "base0"     : "#0d1117",
  \ "base1"     : "#161b22",
  \ "base2"     : "#21262d",
  \ "base3"     : "#89929b",
  \ "base4"     : "#c6cdd5",
  \ "base5"     : "#ecf2f8",
  \ "red"       : "#fa7970",
  \ "orange"    : "#faa356",
  \ "green"     : "#7ce38b",
  \ "lightblue" : "#a2d2fb",
  \ "blue"      : "#77bdfb",
  \ "purp"      : "#cea5fb",
  \ "none"      : "NONE"
  \ }

" Helper
function! s:hi(group, fg, bg, gui)
  exec "hi " . a:group
        \ . " guifg=" . a:fg
        \ . " guibg=" . a:bg
        \ . " gui="   . a:gui
endfunction

" ---------------------------------------------------------------------
" Base UI
" ---------------------------------------------------------------------
call s:hi("Normal",        s:c.base4, s:c.base0, s:c.none)
call s:hi("CursorLine",    s:c.none,  s:c.base1, s:c.none)
call s:hi("CursorColumn",  s:c.none,  s:c.base1, s:c.none)
call s:hi("LineNr",        s:c.base3, s:c.base0, s:c.none)
call s:hi("CursorLineNr",  s:c.base4, s:c.base1, s:c.none)
call s:hi("Visual",        s:c.none,  s:c.base2, s:c.none)

call s:hi("StatusLine",    s:c.base4, s:c.base1, s:c.none)
call s:hi("StatusLineNC",  s:c.base3, s:c.base1, s:c.none)
call s:hi("TabLine",       s:c.base3, s:c.base0, s:c.none)
call s:hi("TabLineSel",    s:c.base4, s:c.base1, s:c.none)

call s:hi("Folded",        s:c.base3, s:c.base1, s:c.none)

" ---------------------------------------------------------------------
" Syntax
" ---------------------------------------------------------------------
call s:hi("Comment",       s:c.base3, s:c.none,  "italic")

call s:hi("Constant",      s:c.blue,  s:c.none,  s:c.none)
call s:hi("String",        s:c.lightblue, s:c.none, s:c.none)
call s:hi("Number",        s:c.blue,  s:c.none,  s:c.none)
call s:hi("Boolean",       s:c.blue,  s:c.none,  s:c.none)

call s:hi("Identifier",    s:c.orange, s:c.none, s:c.none)
call s:hi("Function",      s:c.purp,   s:c.none, s:c.none)

call s:hi("Statement",     s:c.red,   s:c.none, s:c.none)
call s:hi("Conditional",   s:c.red,   s:c.none, s:c.none)
call s:hi("Repeat",        s:c.red,   s:c.none, s:c.none)
call s:hi("Operator",      s:c.base4, s:c.none, s:c.none)

call s:hi("Type",          s:c.green, s:c.none, s:c.none)
call s:hi("PreProc",       s:c.green, s:c.none, s:c.none)

call s:hi("Special",       s:c.orange, s:c.none, s:c.none)
call s:hi("Delimiter",     s:c.base4,  s:c.none, s:c.none)

" ---------------------------------------------------------------------
" Search / Diagnostics
" ---------------------------------------------------------------------
call s:hi("Search",        s:c.base0, s:c.base3, s:c.none)
call s:hi("IncSearch",     s:c.base0, s:c.orange, s:c.none)

call s:hi("Error",         s:c.red,   s:c.base0, "bold")
call s:hi("WarningMsg",    s:c.orange, s:c.none, s:c.none)

" ---------------------------------------------------------------------
" Popup menu
" ---------------------------------------------------------------------
call s:hi("Pmenu",         s:c.base4, s:c.base1, s:c.none)
call s:hi("PmenuSel",      s:c.base0, s:c.blue,  s:c.none)
call s:hi("PmenuSbar",     s:c.none,  s:c.base0, s:c.none)
call s:hi("PmenuThumb",    s:c.none,  s:c.base2, s:c.none)

" ---------------------------------------------------------------------
" Spelling
" ---------------------------------------------------------------------
call s:hi("SpellBad",      s:c.red,       s:c.none, "undercurl")
call s:hi("SpellCap",      s:c.lightblue, s:c.none, "undercurl")
call s:hi("SpellLocal",    s:c.orange,    s:c.none, "undercurl")
call s:hi("SpellRare",     s:c.green,     s:c.none, "undercurl")

highlight StatusLine  ctermfg=7 ctermbg=1 guifg=red guibg=white
