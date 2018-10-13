" -----------------------------------------------------------------------------
" Syntastic specific linters
" -----------------------------------------------------------------------------

" eslint
" ======
" This was a PAIN to set up
" You need to start by running
"   $ npm install --global eslint
   
let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exec='/usr/local/bin/eslint'
" let g:syntastic_javascript_eslint_args='--config ~/.vim/configs/eslintrc'


" -----------------------------------------------------------------------------
" syntastic-local-eslint plugin
" https://github.com/mtscout6/syntastic-local-eslint.vim
" -----------------------------------------------------------------------------
" return full path with the trailing slash
"  or an empty string if we're not in an npm project
fun! s:GetNodeModulesAbsPath ()
  let lcd_saved = fnameescape(getcwd())
  silent! exec "lcd" expand('%:p:h')
  let path = finddir('node_modules', '.;')
  exec "lcd" lcd_saved

  " fnamemodify will return full path with trailing slash;
  " if no node_modules found, we're safe
  return path is '' ? '' : fnamemodify(path, ':p')
endfun

" return full path of local eslint executable
"  or an empty string if no executable found
fun! s:GetEslintExec (node_modules)
  let eslint_guess = a:node_modules is '' ? '' : a:node_modules . '.bin/eslint'
  return exepath(eslint_guess)
endfun

" if eslint_exec found successfully, set it for the current buffer
fun! s:LetEslintExec (eslint_exec)
  if a:eslint_exec isnot ''
    let b:syntastic_javascript_eslint_exec = a:eslint_exec
  endif
endfun

fun! s:main ()
  let node_modules = s:GetNodeModulesAbsPath()
  let eslint_exec = s:GetEslintExec(node_modules)
  call s:LetEslintExec(eslint_exec)
endfun

call s:main()



" the builtin javascript indenting is, much to my chagrin, oft-confused
" autoindent just does the same indentation instead of guessing wrong.
setlocal indentexpr&
setlocal autoindent

setlocal tabstop=2
setlocal softtabstop=0
setlocal sw=2  " Continuation indent
setlocal expandtab

" autocomplete all the things that come in pairs!
inoremap ( ()<Left>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<Left>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<Left>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

let g:javascript_plugin_jsdoc=1
