autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd FileType javascript packadd yajs.vim
autocmd BufNewFile,BufRead *.js,.jsx packadd neoformat
