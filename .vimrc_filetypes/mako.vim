" mako formatting copies HTML formatting, so we have to jump through a
" hoop or two...

au BufNewFile,BufRead *.mako set tabstop=4
au BufNewFile,BufRead *.mako set softtabstop=0
au BufNewFile,BufRead *.mako set shiftwidth=4
au BufNewFile,BufRead *.mako set noexpandtab
au BufNewFile,BufRead *.mako set autoindent
au BufNewFile,BufRead *.mako set wrap

" use this to match mako files with html syntax
" au BufNewFile,BufRead *.mako runtime! syntax/html.vim
au BufNewFile,BufRead *.mako set filetype=mako
au! Syntax mako source ~/.vim/syntax/mako.vim

" turn on omnicomplete for auto-finishing tags
au BufNewFile,BufRead *.mako set omnifunc=htmlcomplete#CompleteTags
" Set </ to omni-complete tags
au BufNewFile,BufRead *.mako inoremap </ </<C-X><C-O>

