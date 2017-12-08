" mako formatting copies HTML formatting, so we have to jump through a
" hoop or two...

setlocal tabstop=4
setlocal softtabstop=0
setlocal shiftwidth=4
setlocal noexpandtab
setlocal autoindent
setlocal wrap

" use this to match mako files with html syntax
" au BufNewFile,BufRead *.mako runtime! syntax/html.vim
setlocal filetype=mako
au! Syntax mako source ~/.vim/syntax/mako.vim

" turn on omnicomplete for auto-finishing tags
setlocal omnifunc=htmlcomplete#CompleteTags
" Set </ to omni-complete tags
inoremap </ </<C-X><C-O>
