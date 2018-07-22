scriptencoding utf-8
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

runtime! options.vim
runtime! autocmd.vim
runtime! mappings.vim
runtime! theme.vim

for s:f in glob('$HOME/.config/nvim/p-*.vim', 0, 1)
  execute 'source ' . s:f
endfor
