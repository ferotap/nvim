" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" Load pathogen paths
" call pathogen#infect('~/.vim_go_runtime/bundle/forked/{}')
" call pathogen#infect('~/.vim_go_runtime/bundle/pristine/{}')
" call pathogen#helptags()

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
    " Plug 'neomake/neomake'
    " Plug 'gregsexton/gitv'
    Plug 'airblade/vim-gitgutter'

    Plug 'scrooloose/nerdtree'
    " Plug 'scrooloose/nerdcommenter'
    " Plug 'jlanzarotta/bufexplorer'

    Plug 'majutsushi/tagbar'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'altercation/vim-colors-solarized'
    " Plug 'noah/vim256-color'

    Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }

    if !exists('g:lsp_support')
        let g:lsp_support='ycm'
    endif
    if g:lsp_support ==? 'ale'
        Plug 'w0rp/ale'
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            Plug 'zchee/deoplete-clang',
            Plug 'zchee/deoplete-go', { 'do': 'make'}
            Plug 'Shougo/neosnippet.vim'
            Plug 'Shougo/neosnippet-snippets'
        else
            Plug 'Shougo/neocomplete'
        endif
    elseif g:lsp_support ==? 'ycm'
        Plug 'Valloric/YouCompleteMe'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
    elseif g:lsp_support ==? 'coc'
        Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-clang',
        Plug 'zchee/deoplete-go', { 'do': 'make'}
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
    endif

    " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tfnico/vim-gradle'

    " javascript
    " Plug 'pangloss/vim-javascript'

    " plantuml
    Plug 'aklt/plantuml-syntax'

    " Restructured Text
    " Plug 'Rykka/riv.vim'
    " Pandoc
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'

    " Plug 'editorconfig/editorconfig-vim'
    "
    " Robot framework
    " Plug 'mfukar/robotframework-vim'

    " Typescript plugins
    Plug 'leafgarland/typescript-vim'
    call plug#end()
" }

" *** Color scheme *** {
try
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

"
" *** LanguageClient *** {
    " Automatically start language servers.
    " let g:LanguageClient_autoStart = 1

    " " Required for operations modifying multiple buffers like rename.
    " set hidden

    " let g:LanguageClient_serverCommands = {
    "     \ 'groovy': ['java', '-jar', '$HOME/work/github.com/palantir/language-servers/groovy-language-server/build/libs/groovy-language-server-0.5.5.jar'],
    "     \ 'javascript': ['javascript-typescript-stdio'],
    "     \ }

" *** LanguageClient *** }

" vim-airline {
    let g:airline#extensions#ale#enabled = 1
    let g:airline_theme='solarized'
" vim-arilien}

" *** Fugitive *** {
    map ]] ]c
    map [[ [c
    map <leader>gdi :Gdiff<cr>
    map <leader>gst :Gstatus<cr>
    map <leader>dup :diffupdate<cr>
" *** Fugitive *** }

" Vim-go {
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_list_type = "location"
" Vim-go }

" Linting and completion configuration {
if g:lsp_support ==? 'ale'
    exec 'source ' . expand('<sfile>:p:h') . '/ale_deo.vim'
elseif g:lsp_support ==? 'ycm'
    exec 'source ' . expand('<sfile>:p:h') . '/ycm_ulti.vim'
elseif g:lsp_support ==? 'coc'
    exec 'source ' . expand('<sfile>:p:h') . '/coc.vim'
endif
" Linting and completion configuration }

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package:1',
        \ 'c:classes',
        \ 'i:interfaces',
        \ 't:traits',
        \ 'e:enums',
        \ 'm:methods',
        \ 'f:fields:1'
    \ ]
    \ }


" *** Typescript {

" *** typescript }
