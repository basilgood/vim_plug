vim.api.nvim_exec([[
  augroup vimRc
    autocmd!
  augroup end
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=500}
  augroup END
  " netrw
  autocmd vimRc FileType netrw call functions#innetrw()
  " qf and help keep widow full width
  autocmd vimRc FileType qf wincmd J
  autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end
  " update diff
  autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif
  " mkdir
  autocmd vimRc BufWritePre * if !isdirectory(expand('%:h', v:true)) | call mkdir(expand('%:h', v:true), 'p') | endif
  " kepp cursor position
  autocmd vimRc BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif
  " external changes
  autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime
  " nopaste
  autocmd vimRc InsertLeave * set nopaste

  " filetype
  autocmd vimRc BufNewFile,BufRead *.jsx setlocal filetype=javascript
  autocmd vimRc BufReadPre,BufNewFile *.tsx setlocal filetype=typescript
  autocmd vimRc BufNewFile,BufRead *.twig setlocal filetype=html.twig
  autocmd vimRc BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
  autocmd vimRc BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
  autocmd vimRc BufNewFile,BufRead config setlocal filetype=config
  autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
  autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
  autocmd vimRc BufReadPre *.json setlocal formatoptions=
  autocmd vimRc FileType git setlocal nofoldenable
  autocmd vimRc FileType gitcommit setlocal spell | setlocal textwidth=72 | setlocal colorcolumn=+1 | setlocal nofoldenable
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * if &buftype ==# 'terminal' | startinsert | endif
  autocmd BufLeave term://* stopinsert
  autocmd TermClose term://* if (expand('<afile>') !~ "fzf") | call nvim_input('<CR>') | endif

  " format
  autocmd vimRc FileType nix setlocal formatprg=nixpkgs-fmt
  autocmd vimRc BufRead,BufNewFile *.nix command! F silent call system('nixpkgs-fmt ' . expand('%'))
  autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! F silent call system('prettier --single-quote --write ' . expand('%'))
  autocmd vimRc BufRead,BufNewFile *.js,*.jsx command! Fix silent call system('eslint --fix ' . expand('%'))
  autocmd vimRc FileType yaml command! F silent call system('prettier --write ' . expand('%'))
  autocmd vimRc FileType sh command! F silent call system('shfmt -i 2 -ci -w ' . expand('%'))
  autocmd vimRc VimLeave * if argc() == 0 | call functions#makesession(1) | else | autocmd vimRc VimLeave * call functions#makesession(0) | endif
]], false)
