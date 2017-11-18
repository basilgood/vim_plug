autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufRead,BufNewFile *.mkd,*.markdown,*.md,*.mdown,*.mkdn
        \ setlocal filetype=mkd
autocmd BufRead,BufNewFile *.yml set filetype=ansible
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END
