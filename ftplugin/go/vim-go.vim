" don't use vim-go default mappings
let g:go_def_mapping_enabled = 0

set number

" Show a list of interfaces which is implemented by the type under your cursor
nmap <buffer> <Leader>gs <Plug>(go-implements)

" Show type info for the word under your cursor
nmap <buffer> <Leader>gi <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
nmap <buffer> <Leader>dh <Plug>(go-doc)
nmap <buffer> <Leader>dv <Plug>(go-doc-vertical)

" Open the Godoc in browser
nmap <buffer> <Leader>gb <Plug>(go-doc-browser)

" Go to definition
nmap <buffer> <Leader> gd <Plug(go-def)
nmap <buffer> <Leader> gh <Plug(go-def-split)
nmap <buffer> <Leader> gv <Plug(go-def-vertical)
nmap <buffer> <Leader> gs <Plug(go-def-stack)
nmap <buffer> <Leader> gc <Plug(go-def-stack-clear)
nmap <buffer> <Leader> gp <Plug(go-def-pop)

" Run/build/test/coverage
nmap <buffer> <leader>gr <Plug>(go-run)
nmap <buffer> <leader>grh <Plug>(go-run-split)
nmap <buffer> <leader>grv <Plug>(go-run-vertical)
nmap <buffer> <leader>gb <Plug>(go-build)
nmap <buffer> <leader>gt <Plug>(go-test)
nmap <buffer> <leader>gtf <Plug>(go-test-func)
nmap <buffer> <leader>gtc <Plug>(go-test-compile)
nmap <buffer> <leader>gc <Plug>(go-coverage)

autocmd BufRead,BufNewFile *_test.go nmap <buffer> <leader>gb <Plug>(go-test-compile)
