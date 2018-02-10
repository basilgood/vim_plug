" scriptencoding utf-8
set shell=/bin/sh

augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd MyVimrc <args>

if has('vim_starting')
  let g:startuptime = reltime()
  AutoCmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

set number
set mouse=a
set cursorline
set noswapfile
set shortmess+=I
set hidden
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set complete=.,w,b,u,t,i,k
set completeopt=menuone
set omnifunc=syntaxcomplete#Complete
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
set hlsearch|nohlsearch
set sidescrolloff=5
set sidescroll=1
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set inccommand=nosplit
set updatetime=750
set clipboard^=unnamedplus,unnamed
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•
set statusline=%<\ %n:%f\ %r%h%w%y%m%=%4v\ %l/%L

nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
nnoremap <C-q> :bwipeout<CR>
nnoremap ,q :bdelete<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
nnoremap H ^
nnoremap L $
vnoremap L g_
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent> <S-Tab>      :wincmd W<CR>
nnoremap <silent> <C-Up> :vertical resize +1<CR>
nnoremap <silent> <C-Down> :vertical resize -1<CR>
vnoremap . :normal .<CR>
nnoremap ,w :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <Leader>s :%s//<left>

filetype plugin indent on
syntax on
silent! colorscheme space-vim-dark

nnoremap - :packadd nerdtree<CR>:NERDTreeToggle<CR>
nnoremap <Leader>- :packadd nerdtree<CR>:NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 3

xmap + <Plug>(EasyAlign)

nnoremap <BS> :CtrlPBuffer<CR>
nnoremap ,m :CtrlPMRUFiles<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
      \   'dir': '\v[\/](bower_components|\node_modules|\.git)$',
      \ }

let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<c-u>call <sid>VSetSearch()<cr>//<cr><c-o>
vnoremap # :<c-u>call <sid>VSetSearch()<cr>??<cr><c-o>

nnoremap ,l :ls<CR>:b

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>:redraw!<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
xnoremap K "sy:Ag '<C-R>s'<CR>

" let g:neomake_open_list = 2
let g:neomake_warning_sign = {
  \ 'text': 'w',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'e',
  \ 'texthl': 'ErrorMsg',
  \ }
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
nmap <F2> :lfirst<cr>
nmap <F3> :llast<cr>
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_html_enabled_makers = ['eslint']
AutoCmd BufReadPost,BufWritePost,CursorHold,CursorHoldI *.yml,.js,.html,.vim,.rb,scss,css,Vagrantfile NeomakeFile
AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
AutoCmd BufEnter *.* :syntax sync fromstart
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
