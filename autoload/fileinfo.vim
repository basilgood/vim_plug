scriptencoding utf-8

function! fileinfo#GetFileInfo()
  let l:permissions = getfperm(expand('%:p'))
  echon  &filetype . ", " . GetFileSize() . ", " . l:permissions
endfunction
function! GetFileSize()
  let l:bytes = getfsize(expand('%:p'))
  if l:bytes <= 0
     return ""
  elseif l:bytes > 1024*1000*1000
    return (bytes / 1024*1000*1000) . "GB"
  elseif l:bytes > 1024*1000
    return (l:bytes / 1024*1000) . "MB"
  elseif l:bytes > 1024
    return (l:bytes / 1024) . "KB"
  else
     return l:bytes . "B"
  endif
endfunction
