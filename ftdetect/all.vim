autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufRead,BufNewFile *.mkd,*.markdown,*.md,*.mdown,*.mkdn
        \ setlocal filetype=mkd
au BufRead,BufNewFile *.yml set filetype=ansible
