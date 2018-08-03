scriptencoding utf-9

filetype plugin indent on
syntax on

if &shell =~# 'fish$'
  set shell=sh
endif

augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd MyVimrc <args>

if has('vim_starting')
  let g:startuptime = reltime()
  AutoCmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

runtime! configs/options.vim
runtime! configs/autocmd.vim
runtime! configs/mappings.vim
runtime! configs/theme.vim

for s:f in glob('$HOME/.config/nvim/configs/p-*.vim', 0, 1)
  execute 'source ' . s:f
endfor
