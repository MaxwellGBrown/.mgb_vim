" Load plugins in ~/.vim/activated
execute pathogen#infect()
syntax on
filetype on
filetype plugin indent on

set ruler
set showcmd

set nobomb

filetype indent on

" Set a common location for backups/temp files to avoid clutter
set dir=~/.vim/vim_temp_files/swap//
set backup
set backupdir=~/.vim/vim_temp_files/backup/,~/tmp,.
set undofile
set undodir=~/.vim/vim_temp_files/undo/

" Below is a copy of restore_view.vim because I couldn't figure out how to
" load it with pathogen
if exists("g:loaded_restore_view")
    finish
endif
let g:loaded_restore_view = 1

if !exists("g:skipview_files")
    let g:skipview_files = []
endif

function! MakeViewCheck()
    if &l:diff | return 0 | endif
    if &buftype != '' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in g:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END

set viewoptions=cursor,folds,slash,unix

" Python file formatting settings
" ---------------------------------------------------------------

" If you are looking to switch between python2 and python3 in flake8,
" check out the MBROWN_README.txt in ~/.vimrc/bundle/flake8

" Syntastic needs to be swapped over if you're using python3
" let g:syntastic_python_python_exec = "/usr/bin/python3"

" using :W will save and then do a Flake8
" au FileType python command W w|call Flake8()

" indenting settings
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set expandtab
au FileType python set autoindent
au FileType python set textwidth=79

" makes backspaces stronger?
" DOESN'T DO ANYTHING APPARENTLY
" au FileType python set backspace=indent,eol,start

" syntax highlighting
au FileType python syntax on
au FileType python let python_highlight_all=1

" Sets default encoding to utf-8
" bomb puts a marker to differentiate between UTF and UCS
au FileType python set encoding=utf-8
au FileType python set bomb

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
" end python formatting --------------------------------------------


" HTML formatting --------------------------------------------------

" indenting settings
au FileType html set tabstop=4
au FileType html set softtabstop=0
au FileType html set shiftwidth=4
au FileType html set noexpandtab
au FileType html set autoindent
" au FileType html set textwidth=79

" Vim's Omnicomplete (Ctrl-X) can complete closing html tags if they're 
" started with '</' (Ctrl-O). We're going to take advantage of this...
au FileType html inoremap </ </<C-X><C-O>

" end HTML formatting ----------------------------------------------



" CSS formatting ---------------------------------------------------
"

" CTRL + TAB will autocomplete css
au FileType css inoremap <C-tab> <C-X><C-O>

" end CSS formatting ----------------------------------------------



" mako formatting --------------------------------------------------
"
" mako formatting copies HTML formatting, so we have to jump through a
" hoop or two...

au BufNewFile,BufRead *.mako set tabstop=4
au BufNewFile,BufRead *.mako set softtabstop=0
au BufNewFile,BufRead *.mako set shiftwidth=4
au BufNewFile,BufRead *.mako set noexpandtab
au BufNewFile,BufRead *.mako set autoindent

" use this to match mako files with html syntax
" au BufNewFile,BufRead *.mako runtime! syntax/html.vim
au BufNewFile,BufRead *.mako set filetype=mako
au! Syntax mako source ~/.vim/syntax/mako.vim

" turn on omnicomplete for auto-finishing tags
au BufNewFile,BufRead *.mako set omnifunc=htmlcomplete#CompleteTags
" Set </ to omni-complete tags
au BufNewFile,BufRead *.mako inoremap </ </<C-X><C-O>

" end mako formatting --------------------------------------------


" jinja2 formatting ----------------------------------------------------------
au BufNewFile,BufRead *.jinja2 set tabstop=4
au BufNewFile,BufRead *.jinja2 set softtabstop=0
au BufNewFile,BufRead *.jinja2 set shiftwidth=4
au BufNewFile,BufRead *.jinja2 set noexpandtab
au BufNewFile,BufRead *.jinja2 set autoindent

" use this to match jinja2 files with html syntax
" au BufNewFile,BufRead *.jinja2 runtime! syntax/html.vim
au BufNewFile,BufRead *.jinja2 set filetype=jinja
au! Syntax jinja2 source ~/.vim/syntax/jinja.vim

" turn on omnicomplete for auto-finishing tags
au BufNewFile,BufRead *.jinja2 set omnifunc=htmlcomplete#CompleteTags
" Set </ to omni-complete tags
au BufNewFile,BufRead *.jinja2 inoremap </ </<C-X><C-O>

" end jinja2 formatting ------------------------------------------------------
