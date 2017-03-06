" per http://stackoverflow.com/questions/4976776/how-to-get-path-to-the-current-vimscript-being-executed
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

execute 'source ' . s:path . '/vimrc/basic.vim'
execute 'source ' . s:path . '/vimrc/filetypes.vim'
execute 'source ' . s:path . '/vimrc/plugins.vim'
" source ~/work/ferotap/dotfiles/vimrc/extended.vim

try
  source ~/.config/nvim/custom_config.vim
catch
endtry
