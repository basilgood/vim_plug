packadd html5.vim
let g:ale_fixers = {
\   'html': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'html': ['eslint'],
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript',
      \}
