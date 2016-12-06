" If you are looking to switch between python2 and python3 in flake8,
" check out the MBROWN_README.txt in ~/.vimrc/bundle/flake8

" Syntastic needs to be swapped over if you're using python3
let g:syntastic_python_python_exec = "/usr/bin/python3"

" using :W will save and then do a Flake8
" au FileType python command W w|call Flake8()

" indenting settings
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set expandtab
au FileType python set autoindent
au FileType python set textwidth=79

" syntax highlighting
au FileType python syntax on
au FileType python let python_highlight_all=1

" continue at the same indent level on a new line
au FileType python set autoindent

" autocomplete all the things that come in pairs!
au FileType python inoremap ( ()<Esc>i
au FileType python inoremap ) <c-r>=ClosePair(')')<CR>
au FileType python inoremap { {}<Esc>i
au FileType python inoremap } <c-r>=ClosePair('}')<CR>
au FileType python inoremap [ []<Esc>i
au FileType python inoremap ] <c-r>=ClosePair(']')<CR>
au FileType python inoremap " <c-r>=QuoteDelim('"')<CR>
au FileType python inoremap ' <c-r>=QuoteDelim("'")<CR>

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
