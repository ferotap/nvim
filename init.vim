" this file
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" linting, completion, lsp setup: ycm, ncm2 or coc. Maybe set on command line
if !exists('g:lsp_support')
    let g:lsp_support = "ncm2"
endif

let mapleader = ","
let g:mapleader = ","

" disable pythonx support
let g:loaded_python2_provider=1

" let g:python_host_prog=$HOME.'/venv/p2/bin/python'
let g:python3_host_prog=$HOME.'/venv/p3/bin/python'


" Open help in a vertical split
autocmd FileType help wincmd L

" *** Basic Settings *** {

    set formatoptions-=c
    set pastetoggle=<F2>
    set scrolloff=10
    set showmatch
    set number
    " set relativenumber
    set completeopt=noinsert,menuone,noselect

    " --- tabs and indent --- {
        set expandtab
        set smarttab
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4
        set shiftround
    " --- tabs and indent --- }

    " --- display of special characters {
        set list
        set listchars=trail:•,precedes:«,extends:»,tab:▸\ 
    " --- display of special characters }

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
    inoremap <C-U> <esc>gUiw`]a

    " open vim config (this file)
    nnoremap <leader>ve :vsplit $MYVIMRC<cr>
    " source vim confi

    nnoremap <leader>vs :source $MYVIMRC<cr>
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

    " session saving and restoring
    nnoremap <Leader>ss :mks! ~/.session.vim<CR>
    nnoremap <Leader>sr :source ~/.session.vim<CR>
    " --- tabs mappings --- {
        map <leader>th :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>tl :tabclose<cr>
        map <leader>tm :tabmove
        map <leader>tj :tabnext<cr>
        map <leader>tk :tabprevious<cr>
        map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    " --- tabs mappings --- }

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
    " --- terminal --- {
            nnoremap <F5> :split<CR> :term python %<CR>
    " --- terminal --- }
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

" *** OS specific settings *** {
    let s:plugin_dir = '~/.local/share/nvim/plugged'
    if !has('nvim')
        let s:plugin_dir = '~/.vim/plugged'
    endif
" *** OS specific settings *** }

" *** NERDTree *** {
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

" *** Plugin Management *** {


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
    " " Plug 'tfnico/vim-gradle'

    " " plantuml
    " Plug 'aklt/plantuml-syntax'

    " " Pandoc
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'vim-pandoc/vim-pandoc-after'

    " " Linting
    Plug 'w0rp/ale'

    " code completion
    if g:lsp_support ==? "ycm"
        echom "using ycm"
        Plug 'Valloric/YouCompleteMe'
    elseif g:lsp_support ==? "ncm2"
        echom "using ncm2"
        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'
        Plug 'ncm2/ncm2-vim-lsp'
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-path'
        Plug 'ncm2/ncm2-jedi'
        Plug 'ncm2/ncm2-ultisnips'
    else
        echom "undefined lsp_support: " . g:lsp_support
    endif

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'

    call plug#end()
" }

" *** Color scheme *** {
try
    let g:solarized_termcolors=16
    colorscheme solarized
    set background=dark
catch
    echom 'colorscheme solarized not found'
endtry

" } color scheme

" *** vim-airline *** {
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#ale#enabled = 1
    let g:airline_theme='solarized'
" *** vim-ariline *** }

" *** junegunn/fzf *** {

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

" ale {
if exists(':ALEComplete')
    echom 'Configuring ALE'
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
endif
" ale }

" *** ncm2 *** {
if g:lsp_support ==? "ncm2"
    echom 'Configuring ncm2'
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <C-space> <c-r>=ncm2#manual_trigger()<cr>
     " imap <expr> <CR> (ncm2#menu_selected() ?
     " \    (ncm2_ultisnips#completed_is_snippet() ?
     " \        "\<Plug>(ncm2_ultisnips_expand_completed)" : "\<c-y>") :
     " \    (pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"))
     " inoremap <silent> <expr> <CR>
     " \   pumvisible() ?
     " \   (!empty(v:completed_item) && ncm2_ultisnips#completed_is_snippet())?
     " \   ncm2_ultisnips#expand() : ncm2#expand()

    set shortmess+=c

    let g:ncm2#manual_complete_length = 1
    let g:ncm2#complete_length = 2
    let g:ncm2#matcher = "substrfuzzy"
    let g:ncm2#sorter = "abbrfuzzy"
    augrou NCM2
        autocmd!
        " enable ncm2 for all buffers
        " au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
        " au User Ncm2PopupClose set completeopt=menuone
        autocmd BufEnter * call ncm2#enable_for_buffer()
        " :help Ncm2PopupOpen for more information
        " When the <Enter> key is pressed while the popup menu is visible, it only
        " hides the menu. Use this mapping to close the menu and also start a new line.
        ! inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    augroup END
endif
" *** ncm2 *** }

" *** UltiSnips *** {
    " P" UltiSnips triggering
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
    let g:UltiSnipsSnippetsDir='.ultisnips'
" let g:UltiSnipsRemoveSelectModeMappings = 0
" }

" *** YCM *** {
if g:lsp_support ==? "ycm"
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_autoclose_preview_window_after_completion = 0
endif
" *** YCM *** }
