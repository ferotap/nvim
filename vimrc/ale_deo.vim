
" *** ale *** {
    let g:ale_open_list = 1
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_java_javalsp_jar = '${HOME}/.vscode/extensions/georgewfraser.vscode-javac-0.2.4/out/fat-jar.jar'

    let g:ale_c_parse_compile_commands = 1

    let g:ale_linters = {
    \   'c': ['ccls', 'clang', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
    \   'go': ['gometalinter --disable-all'],
    \   'groovy': [],
    \   'java': [],
    \}
" *** ale *** }
"
" *** deoplete *** {
    let deoplete#enable_at_startup = 1
" *** deoplete *** }

" *** deoplete-clang *** {
    let g:deoplete#sources#clang#libclang_path='/home/tapio/work/tools/clang/lib/libclang.so'
" *** deoplete-clang *** }
