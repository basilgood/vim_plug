scriptencoding utf-8

AutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | silent! checktime | endif
" AutoCmd BufEnter * syntax sync minlines=500
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
AutoCmd BufWritePre * call mkdir#Easy()
AutoCmd BufEnter * call timer_start(300, function('pack_delayed#plugins'))
AutoCmd InsertLeave * silent! set nopaste
AutoCmd BufLeave * if !&diff | let b:winview = winsaveview() | endif
AutoCmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) |
  \ unlet! b:winview | endif

function! s:hl()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()

command! SP %s/\s\+$//e | normal! ``
