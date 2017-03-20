
" Show a list of interfaces which is implemented by the type under your cursor
nmap <buffer> <Leader>gs <Plug>(go-implements)

" Show type info for the word under your cursor
nmap <buffer> <Leader>gi <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
nmap <buffer> <Leader>gd <Plug>(go-doc)
nmap <buffer> <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
nmap <buffer> <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
nmap <buffer> <leader>gr <Plug>(go-run)
nmap <buffer> <leader>gb <Plug>(go-build)
nmap <buffer> <leader>gt <Plug>(go-test)
nmap <buffer> <leader>gtf <Plug>(go-test-func)
nmap <buffer> <leader>gtc <Plug>(go-test-compile)
nmap <buffer> <leader>gc <Plug>(go-coverage)

