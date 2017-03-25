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
    if !has('nvim')
        Plug 'tpope/vim-sensible'
    endif
    " Plug 'gregsexton/gitv'
    Plug 'airblade/vim-gitgutter'
    " Plug 'jiangmiao/auto-pairs'
    " Plug 'mileszs/ack.vim'
    " Plug 'tpope/vim-vinegar'

    " Plug 'scrooloose/nerdtree'
    " Plug 'scrooloose/nerdcommenter'
    " Plug 'jlanzarotta/bufexplorer'

    Plug 'majutsushi/tagbar'
    " Use ctrlp for now, check whether to switch to fzf later
    " Plug 'ctrlpvim/ctrlp.vim'
    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'noah/vim256-color'

    Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-go', { 'do': 'make'}
    else
        Plug 'Shougo/neocomplete'
    endif
    " Plug 'Shougo/neosnippet'
    " Plug 'Shougo/neosnippet-snippets'
    " Plug 'SirVer/ultisnips'
    " Plug 'Valloric/YouCompleteMe'
    Plug 'scrooloose/syntastic'

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
" let NERDTreeDirArrows=1
" let NERDTreeMinimalUI=1
" let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
" let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
" let NERDTreeChDirMode = 2
" let NERDTreeShowLineNumbers = 1
" let NERDTreeAutoCenter = 1

" Open NERDTree on startup, when no file has been specified
" autocmd VimEnter * if !argc() | NERDTree | endif

" Locate current file in hierarchy
" map <leader>nf :NERDTreeFind<cr>

" Change NerdTree root to current directory
" nmap <leader>nc :NERDTreeCWD<cr>

" Toogle on/off
" nmap <leader>nt :NERDTreeToggle<cr>
" } NERDTree


"------------------------------------------------------------------------------
" BufExplorer
"------------------------------------------------------------------------------

" Shortcuts, type <leader>l to quickly navigate to necessary buffer
" map <leader>l :BufExplorer<cr>
" imap <leader>l <esc>:BufExplorer<cr>
" vmap <leader>l <esc>:BufExplorer<cr>


" *** Fugitive *** {
    map ]] ]c
    map [[ [c
    map <leader>gdi :Gdiff<cr>
    map <leader>gst :Gstatus<cr>
    map <leader>dup :diffupdate<cr>
" *** Fugitive *** }

" *** Syntastic *** {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_aggregate_errors = 1
    let g:syntastic_always_populate_loc_list = 0
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" *** Syntastic *** }

" *** Deoplete *** {

    let g:deoplete#enable_at_startup = 1
    let g:doeplete#enable_smart_case = 1
    let g:deoplete#sources#syntax#min_keyword_length = 2
    let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

    " Let <Tab> also do completion
    inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ "\<TAB>"

    " Close the documentation window when completion is done
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    " --- Deoplete-go --- {
        let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
        " let g:deoplete#sources#go#package_dot = 1
        " let g:deoplete#sources#go#sort_class
    " --- Deoplete-go --- }

    " Close popup by <Space>.
    " inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " Plugin key-mappings.
    " inoremap <expr><C-g>     neocomplete#undo_completion()
    "inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    " function! s:my_cr_function()
    "   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " endfunction
    " " <TAB>: completion.
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " " <C-h>, <BS>: close popup and delete backword char.
    " inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " inoremap <expr><C-y>  neocomplete#close_popup()
    " inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"


" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
    " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
" 
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" *** Deoplete *** }

"------------------------------------------------------------------------------
" Vim-go
"------------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)


" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

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
