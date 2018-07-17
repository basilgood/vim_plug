scriptencoding utf-8

nnoremap <silent> n nzz:call blink#Match()<CR>
nnoremap <silent> N Nzz:call blink#Match()<CR>
cnoremap <silent> <expr> <enter> center#Search()
