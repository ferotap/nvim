" per http://stackoverflow.com/questions/4976776/how-to-get-path-to-the-current-vimscript-being-executed
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let mapleader = ","
let g:mapleader = ","

" disable pythonx support
let g:loaded_python2_provider=1

" let g:python_host_prog=$HOME.'/work/venv/p2/bin/python'
let g:python3_host_prog=$HOME.'/work/venv/p3/bin/python'


" Open help in a vertical split
autocmd FileType help wincmd L
" *** Basic Settings *** {

    set pastetoggle=<F2>
    set scrolloff=10
    set showmatch
    set number
    " set relativenumber

    " --- tabs and indent --- {
        " Use spaces instead of tabs
        set expandtab

        " Be smart when using tabs ;)
        set smarttab

        " 1 tab == 4 spaces
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4

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
    inoremap <C-0> <esc>gUiw`]a

    " visual line down/up/end/start for wrapped lines
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$

    " inoremap <C-x> <nop>
    inoremap jk <esc>
    tnoremap jk <C-\><C-n>
    inoremap kj <esc>
    tnoremap kj <C-\><C-n>
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

execute 'source ' . s:path . '/vimrc/filetypes.vim'
" execute 'source ' . s:path . '/vimrc/plugins.vim'
" source ~/work/ferotap/dotfiles/vimrc/extended.vim
" *** Plugin Management *** {

    let s:plugin_dir = '~/.local/share/nvim/plugged'
    if !has('nvim')
        let s:plugin_dir = '~/.vim/plugged'
    endif

    call plug#begin(s:plugin_dir)

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-vinegar'
    if !has('nvim')
        Plug 'tpope/vim-sensible'
    endif
    "

    Plug 'scrooloose/nerdtree'

    Plug 'majutsushi/tagbar'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'altercation/vim-colors-solarized'


    Plug 'airblade/vim-gitgutter'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'tfnico/vim-gradle'

    " plantuml
    Plug 'aklt/plantuml-syntax'

    " Pandoc
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'

    " Linting
    Plug 'w0rp/ale'

    code completion
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-vim-lsp'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-ultisnips'

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/async.vim'

    call plug#end()
" }
" terminal {
    nnoremap <F5> :split<CR> :term python %<CR>

" terminal }
" ale {
    " Only run linters named in ale_linters settings.
    let g:ale_linters_explicit = 1
    let g:ale_lint_on_text_changed = 0
    " let g:ale_python_pylint_options='--rcfile /mnt/c/boris/repo/current/Build/ConsoleBuild/pylintrc'
    let g:ale_python_pylint_use_global = 0
    " mappings {
        nmap <F12> <Plug>(ale_go_to_definition)
        nmap <S-F12> <Plug>(ale_go_to_definition_in_vsplit)
        nmap <F1> <Plug>(ale_hover)
    " mappings }
    let g:ale_python_pyls_config = {
      \   'pyls': {
      \     'plugins': {
      \       'pycodestyle': {
      \         'enabled': v:false
      \       }
      \     }
      \   },
      \ }
    let g:ale_loclist_msg_format='%linter% -%code: %%s'
    let g:ale_fixers = {
        \   'python': ['black', 'autopep8'],
    \}
    let g:ale_linters = {
        \   'python': ['pyls'],
    \}
" ale }

" ncm2 {
if exists(':Ncm2PopupOpen')
    augroup NCM2
        autocmd!
        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()
        " :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect
        " When the <Enter> key is pressed while the popup menu is visible, it only
        " hides the menu. Use this mapping to close the menu and also start a new line.
        inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
        " uncomment this block if you use vimtex for LaTex
        " autocmd Filetype tex call ncm2#register_source({
        "           \ 'name': 'vimtex',
        "           \ 'priority': 8,
        "           \ 'scope': ['tex'],
        "           \ 'mark': 'tex',
        "           \ 'word_pattern': '\w+',
        "           \ 'complete_pattern': g:vimtex#re#ncm2,
        "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        "           \ })
    augroup END
endif
" ncm2 }

" *** Color scheme *** {
try
    let g:solarized_termcolors=16
    colorscheme solarized
    set background=dark
catch
    echom 'colorscheme solarized not found'
endtry

" } color scheme
" junegunn/fzf {

if &runtimepath =~ 'fzf.vim'
    nnoremap <leader>ff :<C-u>:Files<cr>
    nnoremap <leader>fg :<C-u>:GitFiles<cr>
    nnoremap <leader>fs :<C-u>:GitFiles?<cr>
    nnoremap <leader>fb :<C-u>:Buffers<cr>
    nnoremap <leader>ft :<C-u>:BTags<cr>
    nnoremap <leader>fh :<C-u>:History<cr>
else
    echo 'fzf not found'
endif

" }
" NERDTree {
" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

" Open NERDTree on startup, when no file has been specified
if !exists("g:gui_oni")
    autocmd VimEnter * if !argc() | NERDTree | endif
endif

" Locate current file in hierarchy
map <leader>nf :NERDTreeFind<cr>

" Change NerdTree root to current directory
nmap <leader>nc :NERDTreeCWD<cr>

" Toogle on/off
nmap <leader>nt :NERDTreeToggle<cr>
" } NERDTree
" vim-airline {
    let g:airline#extensions#ale#enabled = 1
    let g:airline_theme='solarized'
" vim-ariline}
" *** Fugitive *** {
    map ]] ]c
    map [[ [c
    map <leader>gdi :Gdiff<cr>
    map <leader>gst :Gstatus<cr>
    map <leader>dup :diffupdate<cr>
" *** Fugitive *** }
" Plugin configuration }

try
  source ~/.config/nvim/custom_config.vim
catch
endtry
