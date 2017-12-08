" autocomplete all the things that come in pairs!

setlocal tabstop=4
setlocal softtabstop=0
setlocal expandtab
setlocal autoindent

inoremap ( ()<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<Esc>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<Esc>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

