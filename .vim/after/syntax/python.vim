" "base0"     : "#0d1117",
" "base1"     : "#161b22",
" "base2"     : "#21262d",
" "base3"     : "#89929b",
" "base4"     : "#c6cdd5",
" "base5"     : "#ecf2f8",
" "red"       : "#fa7970",
" "orange"    : "#faa356",
" "green"     : "#7ce38b",
" "lightblue" : "#a2d2fb",
" "blue"      : "#77bdfb",
" "purp"      : "#cea5fb",
" "none"      : "NONE"

syntax match PriorityComment "#!.*$"
highlight PriorityComment guifg=red

syntax match DoubleComment "##.*$"
highlight DoubleComment guifg=#faa356 gui=bold ctermfg=36

syntax match Star "[*=+]" containedin=ALL
highlight Star guifg=#fa7970

syntax match Parens "[{}()\[\]]"
highlight Parens guifg=#7ce38b

syntax match pythonCustomFPrefix "[fF]\ze['"]" containedin=ALL

highlight link pythonCustomFPrefix Star
highlight link pythonOperator Star
highlight link pythonInclude Star
