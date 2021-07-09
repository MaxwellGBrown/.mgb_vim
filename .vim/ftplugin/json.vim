" autocomplete all the things that come in pairs!

setlocal tabstop=2
setlocal softtabstop=0
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent

inoremap ( ()<Left>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<Left>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<Left>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

