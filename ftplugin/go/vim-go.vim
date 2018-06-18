" don't use vim-go default mappings
let g:go_def_mapping_enabled = 0

set number

" Callers of the funcion under the cursor
nnoremap <buffer> <Leader>ac <Plug>(go-callers)
" Show a list of interfaces which is implemented by the type under your cursor
nmap <buffer> <Leader>ai <Plug>(go-implements)

" Show type info for the word under your cursor
nmap <buffer> <Leader>at <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
nmap <buffer> <Leader>am <Plug>(go-doc)
" ...vertical split
nmap <buffer> <Leader>amv <Plug>(go-doc-vertical)
" ...in browser
nmap <buffer> <Leader>amb <Plug>(go-doc-browser)

" Go to definition
nmap <buffer> <Leader>ad <Plug>(go-def)
nmap <buffer> <Leader>ads <Plug>(go-def-split)
nmap <buffer> <Leader>adv <Plug>(go-def-vertical)

" Stack operations
nmap <buffer> <Leader>as <Plug>(go-def-stack)
nmap <buffer> <Leader>asc <Plug>(go-def-stack-clear)
nmap <buffer> <Leader>asp <Plug>(go-def-pop)

" Run/build/test/coverage
nmap <buffer> <leader>ar <Plug>(go-run)
nmap <buffer> <leader>arh <Plug>(go-run-split)
nmap <buffer> <leader>arv <Plug>(go-run-vertical)
nmap <buffer> <leader>ab <Plug>(go-build)
nmap <buffer> <leader>at <Plug>(go-test)
nmap <buffer> <leader>atf <Plug>(go-test-func)
" nmap <buffer> <leader>atc <Plug>(go-test-compile)
nmap <buffer> <leader>atc <Plug>(go-coverage)

" autocmd BufRead,BufNewFile *_test.go nmap <buffer> <leader>ab <Plug>(go-test-compile)
