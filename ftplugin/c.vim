let path = expand('<sfile>:p:h')
exec 'source' path . '/cmake.vim'

" vim-clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++14"}

" map to <Leader>cf in C++ code
nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
vnoremap <buffer><Leader>cf :ClangFormat<CR>

" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
if g:lsp_support ==? 'coc'
else

    " YcmCompleter subcommands {

    " GoTo
    nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
    " GoTo

    nnoremap <leader>gt :YcmCompleter GetType<CR>
    nnoremap <leader>gm :YcmCompleter GetDoc<CR>

    " Refactor
    nnoremap <leader>gf :YcmCompleter FixIt<CR>
    " nnoremap <leader>gF :YcmCompleter Format<CR>
    nnoremap <leader>gr :YcmCompleter RefactorRename<CR>
    nnoremap <leader>go :YcmCompleter OrganizeImports<CR>
    " Refactor

    " misc
    nnoremap <leader>gO :YcmCompleter OpenProject<CR>
    nnoremap <leader>gR :YcmCompleter RestartServer<CR>
    " misc

    " YcmCompleter subcommands }
endif
