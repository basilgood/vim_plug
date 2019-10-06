set encoding=utf-8
scriptencoding utf-8

augroup vimRc
 autocmd!
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd vimRc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

source $HOME/.config/nvim/rc/environment.vim
source $HOME/.config/nvim/rc/unload.vim
source $HOME/.config/nvim/rc/options.vim
source $HOME/.config/nvim/rc/mapping.vim
source $HOME/.config/nvim/rc/statusline.vim
source $HOME/.config/nvim/rc/hlsearch.vim
source $HOME/.config/nvim/minpac.vim
call commands#commands()
call autocmds#autocmds()
call diff#diff()

" sytax enable.
call vimrc#on_filetype()

set background=dark
silent! colorscheme oceanicnext
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
hi! Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic
hi! Normal guifg=NONE guibg=NONE
hi! EndOfBuffer guifg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! SignColumn ctermbg=NONE guibg=NONE
hi! LineNr ctermbg=NONE guibg=NONE
hi! VertSplit ctermbg=NONE guibg=NONE
hi! CursorLineNr ctermbg=NONE guibg=NONE guifg=#c1c1c1

set secure
