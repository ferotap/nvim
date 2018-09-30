
  augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
  augroup END

  nnoremap <leader>sh :LanguageClientStart
  nnoremap <leader>sl :LanguageClientStop
  nnoremap <leader>sd call LanguageClient_textDocument_definition()

