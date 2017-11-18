autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufRead,BufNewFile *.mkd,*.markdown,*.md,*.mdown,*.mkdn
        \ setlocal filetype=mkd
autocmd BufRead,BufNewFile *.yml set filetype=ansible
autocmd QuickFixCmdPost * botright copen 8
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Highlight current line only on focused window
" autocmd WinEnter,InsertLeave * set cursorline
" autocmd WinLeave,InsertEnter * set nocursorline

" Check if file changed when its window is focus, more eager than 'autoread'
autocmd WinEnter,FocusGained * checktime

autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

" Update filetype on save if empty
autocmd BufWritePost * nested
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
autocmd BufReadPost *
        \ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
        \|   execute 'normal! g`"zvzz'
        \| endif

" Disable paste and/or update diff when leaving insert mode
autocmd InsertLeave *
        \ if &paste | setlocal nopaste mouse=a | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

autocmd FileType gitcommit setlocal spell

autocmd FileType gitcommit,qfreplace setlocal nofoldenable

autocmd FileType markdown
        \ set expandtab
        \ | setlocal spell autoindent formatoptions=tcroqn2 comments=n:>
