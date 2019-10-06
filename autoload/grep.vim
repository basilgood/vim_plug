scriptencoding utf-8

function! IsGitWorkTree() abort
  let l:git=1
  let l:stdout = system('git rev-parse --git-dir 2> /dev/null')
  if l:stdout =~# '\.git'
    let l:git=0
  endif
  return l:git
endfunction

function! grep#dgrep(cmd, args) abort
  if IsGitWorkTree() == 0
    let g:grepprg = 'git  --no-pager grep --exclude-standard --untracked -n'
  else
    let g:grepprg = 'grep --exclude-dir={.git,tag,node_modules,pack,bower_components} --exclude="*.min.js" --exclude="*.js.map" -nHIR'
  endif
  let @/ = a:args
  setlocal hlsearch
  let l:makeprg_bak = &l:makeprg
  let l:errorformat_bak = &l:errorformat

  try
    let &l:makeprg = g:grepprg . ' ' . a:args
    let &l:errorformat = '%f:%l:%c:%m,%f:%l:%m'

    Make
  finally
    let &l:makeprg = l:makeprg_bak
    let &l:errorformat = l:errorformat_bak
  endtry
endfunction
