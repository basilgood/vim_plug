scriptencoding utf-8

function! functions#makesession(overwrite) abort
  let b:sessiondir = $HOME . '/.local/share/nvim/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe 'mksession! ' . b:filename
endfunction

function! functions#loadsession() abort
  let b:sessiondir = $HOME . '/.local/share/nvim/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction

function! functions#listjump(list_type, direction, wrap) abort
  try
    exe a:list_type . a:direction
  catch /E553/
    exe a:list_type . a:wrap
  catch /E42/
    return
  catch /E163/
    return
  endtry
  normal! zz
endfunction
