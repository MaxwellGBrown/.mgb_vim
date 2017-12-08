" If you are looking to switch between python2 and python3 in flake8,
" check out the MBROWN_README.txt in ~/.vimrc/bundle/flake8

" Syntastic needs to be swapped over if you're using python3
let g:syntastic_python_python_exec = "/usr/local/bin/python3"

let g:syntastic_python_checkers=['flake8']

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
inoremap ( ()<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<Esc>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<Esc>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

function QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
    " Inserting a quoted quotation mark into the string
    return a:char
  elseif line[col - 1] == a:char && line[col - 2] != a:char
    " Escaping out of a string
    return "\<Right>"
  else
    " Starting a string
    return a:char.a:char."\<Esc>i"
  endif
endf
