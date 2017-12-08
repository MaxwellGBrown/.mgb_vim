" -----------------------------------------------------------------------------
" Syntastic specific linters
" -----------------------------------------------------------------------------

" eslint
" ======
" This was a PAIN to set up
" You need to start by running
"   $ npm install --global eslint
" Then there needs to be a config file for eslint
" 
" Right now, eslintrc is being referenced in ~/.mgb_vim/.vim/configs/eslintrc
" which is assuming .mgb_vim/.vim is ln -s'd to .vim.
"
" I couldn't get eslintrc to be read via climbing or whatever.
   
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec='/usr/local/bin/eslint'
" let g:syntastic_javascript_eslint_args='--config ~/.vim/configs/eslintrc'


" the builtin javascript indenting is, much to my chagrin, oft-confused
" autoindent just does the same indentation instead of guessing wrong.
setlocal indentexpr&
setlocal autoindent

setlocal tabstop=2
setlocal softtabstop=0
setlocal expandtab

" autocomplete all the things that come in pairs!
inoremap ( ()<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<Esc>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<Esc>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

let g:javascript_plugin_jsdoc=1
