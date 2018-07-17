function! blink#Match()
  let l:target = '\c\%#'.@/
  let l:match = matchadd('IncSearch', l:target)
  redraw
  sleep 100m
  call matchdelete(l:match)
  redraw
endfunction
