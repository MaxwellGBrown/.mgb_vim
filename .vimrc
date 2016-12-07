" =============================================================================
" M   M  GGG  BBB      V   V IIIII M   M     V   V IIIII M   M RRR   CCC      
" MM MM G     B  B     V   V   I   MM MM     V   V   I   MM MM R  R C         
" M M M G GGG BBB      V   V   I   M M M     V   V   I   M M M RRR  C         
" M   M G   G B  B      V V    I   M   M  ..  V V    I   M   M R R  C         
" M   M  GGG  BBB  ___   V   IIIII M   M  ..   V   IIIII M   M R  R  CCC      
" =============================================================================

syntax on
filetype on
filetype plugin indent on

set ruler
set showcmd

set nobomb

" -----------------------------------------------------------------------------
" Pathogen
" Load all plugins in ~/.vim/activated (which are links to ~/.vim/plugins
execute pathogen#infect()
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" Store vim temporary files & backups in a common location
" -----------------------------------------------------------------------------
set dir=~/.vim/vim_temp_files/swap//
set backup
set backupdir=~/.vim/vim_temp_files/backup/,~/tmp,.
set undofile
set undodir=~/.vim/vim_temp_files/undo/


" -----------------------------------------------------------------------------
" Syntastic Settings
" https://github.com/vim-syntastic/syntastic
" -----------------------------------------------------------------------------

" Syntastic Recommended Settings
" ==============================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" My Syntastic Settings
" =====================
nmap <c-k> :lprevious <CR>
nmap <c-j> :lnext <CR>


" -----------------------------------------------------------------------------
" Filetype Specific Settings
" -----------------------------------------------------------------------------

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
