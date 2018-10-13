" =============================================================================
" M   M  GGG  BBB      V   V IIIII M   M     V   V IIIII M   M RRR   CCC      
" MM MM G     B  B     V   V   I   MM MM     V   V   I   MM MM R  R C         
" M M M G GGG BBB      V   V   I   M M M     V   V   I   M M M RRR  C         
" M   M G   G B  B      V V    I   M   M  ..  V V    I   M   M R R  C         
" M   M  GGG  BBB  ___   V   IIIII M   M  ..   V   IIIII M   M R  R  CCC      
" =============================================================================

set exrc
set secure

syntax on
filetype on
filetype plugin indent on

set ruler
set showcmd

set nobomb

set backspace=indent,eol,start


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
" Custom filetypes
" -----------------------------------------------------------------------------
augroup filetype_typescript
  autocmd BufRead,BufNewFile *.ts set filetype=typescript
  autocmd BufNewFile,BufRead *.ts set ft=typescript
augroup END

" -----------------------------------------------------------------------------
" Pair Wrapping Used In .mgb_vim/.vim/ftplugin/
" -----------------------------------------------------------------------------
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
    return a:char.a:char."\<Left>"
  endif
endf


" -----------------------------------------------------------------------------
" Hotkey for getting next found variable during a :grep
" -----------------------------------------------------------------------------

function! CNext()
    execute "w"
    execute "cnext"
endfunction

nmap <silent> <c-n> :call CNext()<CR>



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

let g:syntastic_aggregate_erors = 1


" My Syntastic Settings
" =====================

" Use Ctrl + k and Ctrl + j to move up/down between Syntastic errors
" nmap <c-k> :lprevious <CR>
" nmap <c-j> :lnext <CR>

" If there's a single error, both :lprevious and :lnext should jump to it.
function! WrapCommand(direction)
    if a:direction == "up"
        try
            execute "lprevious"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute "llast"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute "lnext"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute "lfirst"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

" Use Ctrl + k and Ctrl + j to move up/down between Syntastic errors
nmap <silent> <c-k> :call WrapCommand('up')<CR>
nmap <silent> <c-j> :call WrapCommand('down')<CR>
