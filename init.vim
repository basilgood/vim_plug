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

"""" environment
let $CACHE      = expand('$HOME/.cache/')
let $CACHE_HOME = expand('$CACHE/nvim')
let $NVIM_PATH  = expand('~/.config/nvim')

"""" path
set path=.,**

"""" backup, swap, undo
set undofile
set nobackup
set noswapfile

source $NVIM_PATH/rc/unload.vim
source $NVIM_PATH/rc/options.vim
source $NVIM_PATH/rc/mapping.vim
source $NVIM_PATH/rc/statusline.vim
source $NVIM_PATH/rc/hlsearch.vim
source $NVIM_PATH/minpac.vim
call commands#commands()
call autocmds#autocmds()
call diff#diff()

set termguicolors
set background=dark
silent! colorscheme blame
function! MyHighlights() abort
"   hi! Normal       ctermbg=NONE  guibg=NONE
"   hi! EndOfBuffer  ctermbg=NONE  guibg=NONE
"   hi! NonText      ctermbg=NONE  guibg=NONE
"   hi! SignColumn   ctermbg=NONE  guibg=NONE
"   hi! LineNr       ctermbg=NONE  guibg=NONE
"   hi! VertSplit    ctermbg=NONE  guibg=NONE
"   hi! CursorLineNr ctermbg=NONE  guibg=NONE guifg=#c1c1c1
  hi! Comment      guifg=#5c6370 guibg=NONE gui=italic cterm=italic
  hi! ParenMatch   guifg=#85EB6A guibg=#135B00 gui=NONE cterm=NONE term=reverse ctermbg=11
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

set secure
