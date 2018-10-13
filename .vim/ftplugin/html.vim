" indenting settings
setlocal tabstop=2
setlocal softtabstop=0
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
setlocal wrap
" au FileType html set textwidth=79

" Vim's Omnicomplete (Ctrl-X) can complete closing html tags if they're 
" started with '</' (Ctrl-O). We're going to take advantage of this...
inoremap </ </<C-X><C-O>
