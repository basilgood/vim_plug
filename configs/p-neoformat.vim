scriptencoding utf-8

let s:local_prettier_eslint = findfile('node_modules/.bin/prettier-eslint', '.;')

if executable(s:local_prettier_eslint)
  let g:neoformat_javascript_prettiereslint = {
    \ 'exe': './node_modules/.bin/prettier-eslint',
    \ 'args': ['--stdin', '--stdin-filepath', '%:p'],
    \ 'stdin': 1,
    \ }
endif
