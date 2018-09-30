" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let mapleader = ","
let g:mapleader = ","

" disable python2 support
let g:loaded_python_provider=1

" use the specific python3 version. Managed by pyenv.
let g:python3_host_prog=$HOME.'/venv/p3/bin/python'

" Open help in a vertical split
autocmd FileType help wincmd L
" *** Basic Settings *** {

    set pastetoggle=<F2>
    set scrolloff=15
    set showmatch

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
    "
    " --- Wild Menu --- {
        set wildmenu                    " Show list instead of just completing
        set wildmode=list:longest,full
        " Ignore compiled files
        set wildignore=*.o,*~,*.pyc
        if has("win16") || has("win32")
            set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Storeelse
        else
            set wildignore+=.git\*,.hg\*,.svn\*
        endif
    " }

" *** Basic Settings *** }

" *** My Mappings *** {
    " exapnd %% to current buffer dir
    cabbr <expr> %% expand('%:p:h')
    " capitalize the word last edited
    inoremap <C-y> <esc>gUiw`]a

    " visual line down/up/end/start for wrapped lines
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$

    inoremap <C-x> <nop>
    inoremap jk <esc>
    nnoremap Y y$
    nnoremap <leader>le :set listchars-=eol:↲<CR>
    nnoremap <leader>lE :set listchars+=eol:↲<CR>
    nnoremap ö :
    " Fast saving
    map <Leader>w :w<CR>
    imap <Leader>w <ESC>:w<CR>
    vmap <Leader>w <ESC><ESC>:w<CR>

    " --- remap finnish kbd for programming --- {
        function! SetProgrammingKbd()
            inoremap <buffer> ö {
            inoremap <buffer> ä }
            inoremap <buffer> Ö [
            inoremap <buffer> Ä ]
        endfunction
        autocmd FileType go,python,c,cpp,java call SetProgrammingKbd()
    " }

    " --- quickfix and locaction lists --- {

        map <leader>lh :lopen<CR>
        map <leader>ll :lclose<CR>
        map <leader>lj :lnext<CR>
        map <leader>lk :lprev<CR>

        map <leader>ch :copen<CR>
        map <leader>cl :cclose<CR>
        map <leader>cj :cnext<CR>
        map <leader>ck :cprev<CR>

    " }

    " --- tabs mappings --- {
        map <leader>th :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>tl :tabclose<cr>
        map <leader>tm :tabmove
        map <leader>tj :tabnext<cr>
        map <leader>tk :tabprevious<cr>
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
    " Search for selected text, forwards or backwards.
    vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

" *** Search Settings *** }

" Status Line {
" if has('statusline')
"     set laststatus=2
"
"     " set statusline=%<%t\                     " Filename
"     set statusline=%f                        " Filename
"     set statusline+=(%{&fo})                 " formatting options
"     set statusline+=%w%h%m                   " Options
"     set statusline+=%#warningmsg#
"     if has(':SyntasticCheck')
"     	set statusline+=%{SyntasticStatuslineFlag()}
"     endif
"     set statusline+=%*
"
"     if exists(':Gread')
"         set statusline+=%{fugitive#statusline()} " Git status 
"     endif
"     " set statusline+=\ [%{&ff}/%Y]            " Filetype
"     set statusline+=\ [%Y]            " Filetype
"     " set statusline+=\ [%{getcwd()}]          " Current dir
"     " set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"     set statusline+=%=%-14.(%o:%l/%L,%c%V%)\      " Right aligned file nav info
" endif

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" } statusline
