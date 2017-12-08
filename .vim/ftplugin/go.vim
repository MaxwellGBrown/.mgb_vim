au BufNewFile,BufRead *.go set autoindent
au BufNewFile,BufRead *.go set tabstop=4

au BufNewFile,BufRead *.go let g:go_fmt_command = "goimports"
au BufNewFile,BufRead *.go let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
au BufNewFile,BufRead *.go let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
au BufNewFile,BufRead *.go let g:go_term_enabled = 1
