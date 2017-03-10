" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let mapleader = ","
let g:mapleader = ","

let g:python3_host_prog='/home/etaphol/.pyenv/versions/neovim3/bin/python'

" Open help in a vertical split
" autocmd FileType help wincmd L

" *** Basic Settings *** {

    set scrolloff=999

    " --- tabs and indent --- {
        " Use spaces instead of tabs
        set expandtab

        " Be smart when using tabs ;)
        set smarttab

        " 1 tab == 4 spaces
        set shiftwidth=4
        set tabstop=4

        " Round indent to multiple of 'shiftwidth' for > and < commands
        set shiftround

    " --- tabs and indent --- }

    " --- display of special characters {
        set list
        set listchars=trail:•,precedes:«,extends:»,tab:▸\ 
    " --- display of special characters }

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
    nnoremap <leader>le :set listchars-=eol:↲<CR>
    nnoremap <leader>lE :set listchars+=eol:↲<CR>
    " Fast saving
    map <Leader>w :w<CR>
    imap <Leader>w <ESC>:w<CR>
    vmap <Leader>w <ESC><ESC>:w<CR>

    " --- fi to en keyboard layout --- {
        nnoremap ö :
    " --- fi to en keyboard layout --- }

    " --- tabs mappings --- {
        map <leader>tn :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>tc :tabclose<cr>
        map <leader>tm :tabmove
        map <leader>tl :tabnext<cr>
        map <leader>th :tabprevious<cr>
        map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    " --- tabs mappings --- }
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
