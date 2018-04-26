autocmd BufNewFile,BufRead *.html set filetype=html
autocmd FileType html packadd html5.vim | packadd yajs.vim | packadd vim-html-js-indent
