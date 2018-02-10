

" AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
" AutoCmd BufEnter * packadd vim-repeat
" AutoCmd BufEnter * packadd vim-surround
" AutoCmd BufEnter * packadd vim-commentary
" AutoCmd BufEnter * packadd cmdline-completion
" AutoCmd FileType apache setlocal commentstring=#\ %s
" AutoCmd FileType jinja setlocal commentstring={#\ %s\ \#}
" AutoCmd FileType twig setlocal commentstring={#\ %s\ \#}
" AutoCmd FileType twig.html setlocal commentstring={#\ %s\ \#}
" AutoCmd FileType dosini setlocal commentstring=#\ %s
" AutoCmd FileType vim,javascript,html,yaml,json,twig,ansible,scss packadd ale
" AutoCmd BufReadPre *.j2 packadd Vim-Jinja2-Syntax
" AutoCmd BufReadPre *.twig packadd vim-twig
" AutoCmd BufReadPre *.html packadd html5.vim
" AutoCmd BufReadPre *.yml packadd yaml-vim
" AutoCmd BufReadPre *.js packadd yajs.vim
" AutoCmd BufReadPre *.md packadd vim-markdown
" AutoCmd BufReadPre *.fish packadd vim-fish
" AutoCmd BufReadPre *.nginx packadd nginx.vim
" AutoCmd BufReadPre *.coffee packadd vim-coffee-script
" AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
" AutoCmd InsertLeave * set nopaste
" AutoCmd BufEnter * syntax sync minlines=99999
" AutoCmd BufRead *.yamllint setlocal filetype=yaml
" AutoCmd BufRead *.editorconfig setlocal filetype=dosini
" AutoCmd BufRead,BufNewFile *.html set filetype=html
