" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

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
    Plug 'airblade/vim-gitgutter'

    Plug 'scrooloose/nerdtree'

    Plug 'majutsushi/tagbar'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'altercation/vim-colors-solarized'


    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tfnico/vim-gradle'

    " plantuml
    Plug 'aklt/plantuml-syntax'

    " Pandoc
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'


    " Plug 'w0rp/ale'
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
    Plug 'prabirshrestha/vim-lsp'

    call plug#end()
" }

if exists("g:ncm2#popup_delay")
    execute 'source ' . s:path . '/ncm2.vim'
endif

if has("g:ale_linters_explicit")
    " Only run linters named in ale_linters settings.
    let g:ale_linters_explicit = 1
    let g:ale_fixers = {
        \   'python': ['black', 'autopep8'],
    \}
    let g:ale_linters = {
        \   'python': ['pyls', 'flake8', 'pylint'],
    \}
endif

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


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


let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
" *** Typescript {

" *** typescript }
