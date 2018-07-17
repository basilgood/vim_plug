function! indentwise#level(inc)
  " Get the cursor current position
  let l:currentPos = getpos('.')
  let l:currentLine = l:currentPos[1]
  let l:matchIndent = 0

  " Look for a line with the same indent level whithout going out of the buffer
  while !l:matchIndent && l:currentLine != line('$') + 1 && l:currentLine != -1
    let l:currentLine += a:inc
    let l:matchIndent = indent(l:currentLine) == indent('.')
  endwhile

  " If a line is found go to this line
  if (l:matchIndent)
    let l:currentPos[1] = l:currentLine
    call setpos('.', l:currentPos)
  endif
endfunction
