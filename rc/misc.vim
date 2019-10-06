scriptencoding utf-8

" submode.
function! SubMode()
  call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
  call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
  call submode#map('resize', 'n', '', '.', '<C-W>>')
  call submode#map('resize', 'n', '', ',', '<C-W><')
  call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
  call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
  call submode#map('resize', 'n', '', '-', '<C-W>-')
  call submode#map('resize', 'n', '', '=', '<C-W>+')
  call submode#leave_with('resize', 'n', '', '<Esc>')
  call submode#enter_with('scroll-h', 'n', '', 'zl', 'zl')
  call submode#enter_with('scroll-h', 'n', '', 'zh', 'zh')
  call submode#enter_with('scroll-h', 'n', '', 'zL', 'zL')
  call submode#enter_with('scroll-h', 'n', '', 'zH', 'zH')
  call submode#map('scroll-h', 'n', '', 'l', 'zl')
  call submode#map('scroll-h', 'n', '', 'h', 'zh')
  call submode#map('scroll-h', 'n', '', 'L', 'zL')
  call submode#map('scroll-h', 'n', '', 'H', 'zH')
endfunction
autocmd vimRc BufReadPre * packadd vim-submode | call SubMode()

" startify
nnoremap [Space]q :SC<cr>
let g:startify_files_number        = 5
let g:startify_change_to_dir       = 0
let g:startify_enable_special      = 0
let g:startify_update_oldfiles     = 1
let g:startify_session_dir         = '~/.cache/nvim/session'

if !exists('g:startify_bookmarks')
  let g:startify_bookmarks = []
endif

let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   Recent files'] },
      \ { 'type': 'sessions',  'header': ['   Sessions'], 'indices': ['A','B','C'] },
      \ ]

let g:startify_custom_header = []
" let g:startify_custom_header = [
"       \ "  ",
"       \ '   ╻ ╻   ╻   ┏┳┓',
"       \ '   ┃┏┛   ┃   ┃┃┃',
"       \ '   ┗┛    ╹   ╹ ╹',
"       \ '   ',
"       \ ]
function! s:save_session() abort
  if !empty(v:this_session) && get(g:, 'startify_session_persistence')
    call startify#session_write(v:this_session)
  endif
endfunction

autocmd BufNewFile,BufAdd,BufDelete,BufLeave * call s:save_session()

" localvimrc
let g:localvimrc_ask = 0
