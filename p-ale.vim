scriptencoding utf-8

let g:ale_sign_error = '→'
let g:ale_sign_warning = '→'
let g:ale_pattern_options_enabled = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint']
      \}
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'yaml': ['yamllint']
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript',
      \ 'ansible': 'yaml'
      \}
