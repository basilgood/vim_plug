scriptencoding utf-8

function! center#Search()
  let l:cmdtype = getcmdtype()
  if l:cmdtype ==? '/' || l:cmdtype ==? '?'
    return "\<enter>zz"
  endif
  return "\<enter>"
endfunction
