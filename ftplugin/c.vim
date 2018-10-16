let path = expand('<sfile>:p:h')
exec 'source' path . '/cmake.vim'

if exists('g:use_ale')
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
