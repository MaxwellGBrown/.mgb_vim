au BufNewFile,BufRead *.jinja2 set tabstop=4
au BufNewFile,BufRead *.jinja2 set softtabstop=0
au BufNewFile,BufRead *.jinja2 set shiftwidth=4
au BufNewFile,BufRead *.jinja2 set noexpandtab
au BufNewFile,BufRead *.jinja2 set autoindent
au BufNewFile,BufRead *.jinja2 set autoindent

" use this to match jinja2 files with html syntax
" au BufNewFile,BufRead *.jinja2 runtime! syntax/html.vim
au BufNewFile,BufRead *.jinja2 set filetype=jinja
au! Syntax jinja2 source ~/.vim/syntax/jinja.vim

" turn on omnicomplete for auto-finishing tags
au BufNewFile,BufRead *.jinja2 set omnifunc=htmlcomplete#CompleteTags
" Set </ to omni-complete tags
au BufNewFile,BufRead *.jinja2 inoremap </ </<C-X><C-O>

