scriptencoding utf-8

" git.
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<CR>
nnoremap <silent> [fugitive]C :<C-u>Gcommit --amend<CR>
nnoremap <silent> [fugitive]a :<C-u>Dispatch! git add %<CR>
nnoremap <silent> [fugitive]r :<C-u>Dispatch! git reset %<CR>
nnoremap <silent> [fugitive]D :<C-u>Dispatch! git checkout -- %<CR>
nnoremap <silent> [fugitive]p :<C-u>Dispatch! git push<CR>
nnoremap <silent> [fugitive]P :<C-u>Dispatch! git push -f<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Gitv --all<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zf :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

function! s:enable_git_plugins() abort
  if system('git rev-parse --is-inside-work-tree') =~# '\m\C^true'
    packadd vim-fugitive
    packadd gitv
    packadd auto-git-diff
    packadd conflict3
    " autocmd vimRc FocusGained,FocusLost,CursorHold * if !bufexists("[Command Line]") | SignifyRefresh | SignifyEnable | endif
  endif
endfunction
autocmd! vimRc BufReadPre * call s:enable_git_plugins()
