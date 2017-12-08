" indenting settings
au FileType html set tabstop=4
au FileType html set softtabstop=0
au FileType html set shiftwidth=4
au FileType html set noexpandtab
au FileType html set autoindent
au FileType html set wrap
" au FileType html set textwidth=79

" Vim's Omnicomplete (Ctrl-X) can complete closing html tags if they're 
" started with '</' (Ctrl-O). We're going to take advantage of this...
au FileType html inoremap </ </<C-X><C-O>
