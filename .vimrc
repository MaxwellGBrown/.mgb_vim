" Load plugins in ~/.vim/activated
execute pathogen#infect()
syntax on
filetype on
filetype plugin indent on

set ruler
set showcmd

set nobomb

filetype indent on

let g:syntastic_python_checkers=['flake8']

" Set a common location for backups/temp files to avoid clutter
set dir=~/.vim/vim_temp_files/swap//
set backup
set backupdir=~/.vim/vim_temp_files/backup/,~/tmp,.
set undofile
set undodir=~/.vim/vim_temp_files/undo/


" Import filetype-specific settings, which are split into separate files
" within ./.vimrc_filetypes/
let vimrc_dir = join(split(resolve(expand('<sfile>:p')), '/')[0:-2], '/')

exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/python.vim'
exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/html.vim'



" HTML formatting --------------------------------------------------

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
au BufNewFile,BufRead *.mako set wrap

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


" .jsx formatting ------------------------------------------------------------

" autocomplete all the things that come in pairs!

au BufNewFile,BufRead *.jsx set tabstop=4
au BufNewFile,BufRead *.jsx set softtabstop=0
au BufNewFile,BufRead *.jsx set expandtab

au BufNewFile,BufRead *.jsx inoremap ( ()<Esc>i
au BufNewFile,BufRead *.jsx inoremap ) <c-r>=ClosePair(')')<CR>
au BufNewFile,BufRead *.jsx inoremap { {}<Esc>i
au BufNewFile,BufRead *.jsx inoremap } <c-r>=ClosePair('}')<CR>
au BufNewFile,BufRead *.jsx inoremap [ []<Esc>i
au BufNewFile,BufRead *.jsx inoremap ] <c-r>=ClosePair(']')<CR>
au BufNewFile,BufRead *.jsx inoremap " <c-r>=QuoteDelim('"')<CR>
au BufNewFile,BufRead *.jsx inoremap ' <c-r>=QuoteDelim("'")<CR>

au BufNewFile,BufRead *.jsx let g:javascript_plugin_jsdoc=1
" end .jsx formatting ---------------------------------------------------------

" .json formatting ------------------------------------------------------------

" autocomplete all the things that come in pairs!

au BufNewFile,BufRead *.json set tabstop=4
au BufNewFile,BufRead *.json set softtabstop=0
au BufNewFile,BufRead *.json set expandtab
au BufNewFile,BufRead *.json set autoindent

au BufNewFile,BufRead *.json inoremap ( ()<Esc>i
au BufNewFile,BufRead *.json inoremap ) <c-r>=ClosePair(')')<CR>
au BufNewFile,BufRead *.json inoremap { {}<Esc>i
au BufNewFile,BufRead *.json inoremap } <c-r>=ClosePair('}')<CR>
au BufNewFile,BufRead *.json inoremap [ []<Esc>i
au BufNewFile,BufRead *.json inoremap ] <c-r>=ClosePair(']')<CR>
au BufNewFile,BufRead *.json inoremap " <c-r>=QuoteDelim('"')<CR>
au BufNewFile,BufRead *.json inoremap ' <c-r>=QuoteDelim("'")<CR>
" end .json formatting ---------------------------------------------------------


" .jsx formatting ------------------------------------------------------------

" autocomplete all the things that come in pairs!

au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.js set softtabstop=0
au BufNewFile,BufRead *.js set expandtab

au BufNewFile,BufRead *.js inoremap ( ()<Esc>i
au BufNewFile,BufRead *.js inoremap ) <c-r>=ClosePair(')')<CR>
au BufNewFile,BufRead *.js inoremap { {}<Esc>i
au BufNewFile,BufRead *.js inoremap } <c-r>=ClosePair('}')<CR>
au BufNewFile,BufRead *.js inoremap [ []<Esc>i
au BufNewFile,BufRead *.js inoremap ] <c-r>=ClosePair(']')<CR>
au BufNewFile,BufRead *.js inoremap " <c-r>=QuoteDelim('"')<CR>
au BufNewFile,BufRead *.js inoremap ' <c-r>=QuoteDelim("'")<CR>

au BufNewFile,BufRead *.js let g:javascript_plugin_jsdoc=1
" end .jsx formatting ---------------------------------------------------------


