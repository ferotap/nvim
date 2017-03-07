" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let mapleader = ","
let g:mapleader = ","
" *** Basic Settings *** {
    set scrolloff=999
" *** Basic Settings *** }

" My Mappings {
    " exapnd %% to current buffer dir
    cabbr <expr> %% expand('%:p:h')
    " capitalize the word last edited
    inoremap <C-y> <esc>gUiw`]a

    inoremap <C-x> <nop>
    inoremap kj <esc>
    inoremap KJ <esc>
    inoremap jk <esc>
    inoremap JK <esc>
    nnoremap Y y$
    nnoremap ö :
    nnoremap <leader>le :set listchars-=eol:↲<CR>
    nnoremap <leader>lE :set listchars+=eol:↲<CR>
    " Fast saving
    map <Leader>w :w<CR>
    imap <Leader>w <ESC>:w<CR>
    vmap <Leader>w <ESC><ESC>:w<CR>

" }

" *** Search Settings *** {
    set incsearch
    set hlsearch
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    " Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
      nnoremap <silent> <C-L>
        \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
    endif
" *** Search Settings *** }

" Status Line {
if has('statusline')
    set laststatus=2

    set statusline=%<%t\                     " Filename
    set statusline+=(%{&fo})                 " formatting options
    set statusline+=%w%h%m                   " Options
    set statusline+=%#warningmsg#
    if has(':SyntasticCheck')
    	set statusline+=%{SyntasticStatuslineFlag()}
    endif
    set statusline+=%*

    if exists(':Gread')
        set statusline+=%{fugitive#statusline()} " Git status 
    endif
    " set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%Y]            " Filetype
    " set statusline+=\ [%{getcwd()}]          " Current dir
    " set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    set statusline+=%=%-14.(%l/%L,%c%V%)\      " Right aligned file nav info
endif

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" } statusline
