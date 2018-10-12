
" *** ale *** {
    let g:ale_open_list = 1
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_java_javalsp_jar = '${HOME}/.vscode/extensions/georgewfraser.vscode-javac-0.2.4/out/fat-jar.jar'
    let g:ale_linters = {
    \   'go': ['gometalinter --disable-all'],
    \   'groovy': [],
    \   'java': [],
    \}
" *** ale *** }
