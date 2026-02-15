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
" "none"      : "NONE",
" "orange2"   : "#FFA657", " Named parameters
" "deepblue"  : ""

syntax keyword pythonSelf self

syntax match DoubleComment "##.*$"
syntax match Parens "[{}()\[\]]"
syntax match PriorityComment "#!.*$"
syntax match Star "[*=//+]" " containedin=ALL
syntax match pythonCustomFPrefix "[fF]\ze['"]" containedin=ALL
syntax match pythonInit "\<__init__\>" containedin=pythonFunction

highlight DoubleComment guifg=#faa356 gui=bold ctermfg=36
highlight Parens guifg=#7ce38b
highlight PriorityComment guifg=red
highlight Star guifg=#fa7970

highlight link pythonCustomFPrefix Star
highlight link pythonInclude Star
highlight link pythonInit Star
highlight link pythonInit pythonBuiltin
highlight link pythonOperator Star

highlight pythonBuiltin guifg=#79C0FF
highlight pythonSelf guifg=#79C0FF ctermfg=183
