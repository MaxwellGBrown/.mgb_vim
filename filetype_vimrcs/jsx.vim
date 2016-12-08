" autocomplete all the things that come in pairs!

au BufNewFile,BufRead *.jsx set tabstop=4
au BufNewFile,BufRead *.jsx set softtabstop=0
au BufNewFile,BufRead *.jsx set expandtab

au BufNewFile,BufRead *.jsx inoremap ( ()<Esc>i
au BufNewFile,BufRead *.jsx inoremap ) <c-r>=ClosePair(')')<CR>
au BufNewFile,BufRead *.jsx inoremap { {}<Esc>i
au BufNewFile,BufRead *.jsx inoremap } <c-r>=ClosePair('}')<CR>
au BufNewFile,BufRead *.jsx inoremap [ []<Esc>i
au BufNewFile,BufRead *.jsx inoremap ] <c-r>=ClosePair(']')<CR>
au BufNewFile,BufRead *.jsx inoremap " <c-r>=QuoteDelim('"')<CR>
au BufNewFile,BufRead *.jsx inoremap ' <c-r>=QuoteDelim("'")<CR>

au BufNewFile,BufRead *.jsx let g:javascript_plugin_jsdoc=1
