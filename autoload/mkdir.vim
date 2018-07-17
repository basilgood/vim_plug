scriptencoding utf-8

function! mkdir#Easy()
  let s:dir = expand('<afile>:p:h')
  if !isdirectory(s:dir)
    call mkdir(s:dir, 'p')
  endif
endfunction
