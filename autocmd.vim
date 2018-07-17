AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
AutoCmd CmdLineEnter * packadd cmdline-completion
AutoCmd BufWritePre * call mkdir#Easy()
AutoCmd BufEnter * call timer_start(100, function('pack_delayed#plugins'))
AutoCmd InsertLeave * silent! set nopaste
AutoCmd BufLeave * if !&diff | let b:winview = winsaveview() | endif
AutoCmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) |
  \ unlet! b:winview | endif

command! SP %s/\s\+$//e | normal! ``

function! s:hl()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()
