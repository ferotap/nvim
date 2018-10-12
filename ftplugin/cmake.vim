nnoremap <leader>gc :!cmake -H. -Bbuild<CR>
nnoremap <leader>gC :!cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON<CR>
set makeprg=cmake\ --build\ build
