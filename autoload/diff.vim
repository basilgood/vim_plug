scriptencoding utf-8

if &diff
  setlocal syntax=off
  setlocal nospell
  setlocal cursorline
endif

augroup aug_diffs
  au!

  " Inspect whether some windows are in diff mode, and apply changes for such windows
  " Run asynchronously, to ensure '&diff' option is properly set by Vim
  au WinEnter,BufEnter * if !bufexists("[Command Line]") | call timer_start(50, 'CheckDiffMode')

  " Highlight VCS conflict markers
  au VimEnter,WinEnter * if !exists('w:_vsc_conflict_marker_match') |
        \   let w:_vsc_conflict_marker_match = matchadd('ErrorMsg', '^\(<\|=\||\|>\)\{7\}\([^=].\+\)\?$') |
        \ endif
augroup END

" In diff mode:
" - Disable syntax highlighting
" - Disable spell checking
function! CheckDiffMode(timer) abort
  let curwin = winnr()

  " Check each window
  if !bufexists('[Command Line]')
    for _win in range(1, winnr('$'))
      exe 'noautocmd ' . _win . 'wincmd w'

      call s:change_option_in_diffmode('b:', 'syntax', 'off')
      call s:change_option_in_diffmode('w:', 'spell', 0, 1)
      call s:change_option_in_diffmode('w:', 'cursorline', 1, 1)
    endfor

    " Get back to original window
    exe 'noautocmd ' . curwin . 'wincmd w'
  endif
endfunction

" Detect window or buffer local option is in sync with diff mode
function! s:change_option_in_diffmode(scope, option, value, ...) abort
  let isBoolean = get(a:, '1', 0)
  let backupVarname = a:scope . '_old_' . a:option

  " Entering diff mode
  if &diff && !exists(backupVarname)
    exe 'let ' . backupVarname . '=&' . a:option
    call s:set_option(a:option, a:value, 1, isBoolean)
  endif

  " Exiting diff mode
  if !&diff && exists(backupVarname)
    let oldValue = eval(backupVarname)
    call s:set_option(a:option, oldValue, 1, isBoolean)
    exe 'unlet ' . backupVarname
  endif
endfunction

function! s:set_option(option, value, ...) abort
  let isLocal = get(a:, '1', 0)
  let isBoolean = get(a:, '2', 0)
  if isBoolean
    exe (isLocal ? 'setlocal ' : 'set ') . (a:value ? '' : 'no') . a:option
  else
    exe (isLocal ? 'setlocal ' : 'set ') . a:option . '=' . a:value
  endif
endfunction

function! diff#diff() abort
endfunction
