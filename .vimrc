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
exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/css.vim'
exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/mako.vim'
exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/jinja2.vim'
exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/jsx.vim'
exec 'source ' . '/' . vimrc_dir . '/.vimrc_filetypes/json.vim'
