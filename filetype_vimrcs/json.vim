" autocomplete all the things that come in pairs!

au BufNewFile,BufRead *.json set tabstop=4
au BufNewFile,BufRead *.json set softtabstop=0
au BufNewFile,BufRead *.json set expandtab
au BufNewFile,BufRead *.json set autoindent

au BufNewFile,BufRead *.json inoremap ( ()<Esc>i
au BufNewFile,BufRead *.json inoremap ) <c-r>=ClosePair(')')<CR>
au BufNewFile,BufRead *.json inoremap { {}<Esc>i
au BufNewFile,BufRead *.json inoremap } <c-r>=ClosePair('}')<CR>
au BufNewFile,BufRead *.json inoremap [ []<Esc>i
au BufNewFile,BufRead *.json inoremap ] <c-r>=ClosePair(']')<CR>
au BufNewFile,BufRead *.json inoremap " <c-r>=QuoteDelim('"')<CR>
au BufNewFile,BufRead *.json inoremap ' <c-r>=QuoteDelim("'")<CR>

