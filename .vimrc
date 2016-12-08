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

" Debugging Syntastic
" ===================
" syntastic_debug levels:
" 1 - logs syntastic's workflow
" 3 - logs workflow, checker's output, and location-list manipulators
" 33 - logs workflow and checker-specific-details (e.g. version checks)
" let g:syntastic_debug=3

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
" within ./filetype_vimrcs/
let vimrc_dir = join(split(resolve(expand('<sfile>:p')), '/')[0:-2], '/')

exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/python.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/html.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/css.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/mako.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/jinja2.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/jsx.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/json.vim'
exec 'source ' . '/' . vimrc_dir . '/filetype_vimrcs/javascript.vim'
