" autocomplete all the things that come in pairs!

au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.js set softtabstop=0
au BufNewFile,BufRead *.js set expandtab

au BufNewFile,BufRead *.js inoremap ( ()<Esc>i
au BufNewFile,BufRead *.js inoremap ) <c-r>=ClosePair(')')<CR>
au BufNewFile,BufRead *.js inoremap { {}<Esc>i
au BufNewFile,BufRead *.js inoremap } <c-r>=ClosePair('}')<CR>
au BufNewFile,BufRead *.js inoremap [ []<Esc>i
au BufNewFile,BufRead *.js inoremap ] <c-r>=ClosePair(']')<CR>
au BufNewFile,BufRead *.js inoremap " <c-r>=QuoteDelim('"')<CR>
au BufNewFile,BufRead *.js inoremap ' <c-r>=QuoteDelim("'")<CR>

au BufNewFile,BufRead *.js let g:javascript_plugin_jsdoc=1
