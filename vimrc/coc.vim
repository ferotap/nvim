" coc configuration

" neosnippet {
	" SuperTab like snippets' behavior.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    if has('neosnippet')
        imap <expr><TAB>
        \ neosnippet#expandable_or_jumpable() ?
        \    "\<Plug>(neosnippet_expand_or_jump)" :
            \ 	  pumvisible() ? "\<C-n>" : "\<TAB>"

    " 	imap <expr><TAB>
    " 	 \ pumvisible() ? "\<C-n>" :
    " 	 \ neosnippet#expandable_or_jumpable() ?
    " 	 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    endif
" neosnippet }
