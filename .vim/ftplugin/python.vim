" If you are looking to switch between python2 and python3 in flake8,
" check out the MBROWN_README.txt in ~/.vimrc/bundle/flake8

" Syntastic needs to be swapped over if you're using python3
let g:syntastic_python_python_exec = "/usr/local/bin/python3"

let g:syntastic_python_checkers=[]
let g:syntastic_python_checkers=g:syntastic_python_checkers + ['flake8']
let g:syntastic_python_checkers=g:syntastic_python_checkers + ['pycodestyle']
let g:syntastic_python_checkers=g:syntastic_python_checkers + ['pydocstyle']
" let g:syntastic_python_checkers=g:syntastic_python_checkers + ['pylint']

" using :W will save and then do a Flake8
" au FileType python command W w|call Flake8()

" indenting settings
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal textwidth=79

let python_highlight_all=1

" continue at the same indent level on a new line
set autoindent

" autocomplete all the things that come in pairs!
inoremap ( ()<Left>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<Left>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<Left>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
