augroup MyVimrc
  autocmd!
augroup END

command! -nargs=* AutoCmd autocmd MyVimrc <args>

if has('vim_starting')
  let g:startuptime = reltime()
  AutoCmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

set shell=bash

if empty(glob('~/.config/nvim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
endif

set packpath^=~/.config/nvim
silent! packadd minpac

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('liuchengxu/space-vim-dark', {'type': 'opt'})
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('sgur/vim-editorconfig')
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('lumiliet/vim-twig', {'type': 'opt'})
  call minpac#add('othree/html5.vim', { 'type': 'opt' })
  call minpac#add('gabrielelana/vim-markdown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})
  call minpac#add('aliva/vim-fish', { 'type': 'opt' })
  call minpac#add('mrk21/yaml-vim', { 'type': 'opt' })
  call minpac#add('kchmck/vim-coffee-script', { 'type': 'opt' })
  call minpac#add('othree/yajs.vim', { 'type': 'opt' })
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('sgur/cmdline-completion', {'type': 'opt'})
  call minpac#add('w0rp/ale', { 'type': 'opt' })
  call minpac#add('gabesoft/vim-ags')
endif

set number
set mouse=a
set cursorline
set noswapfile
set shortmess=atI
set hidden
set splitbelow
set splitright
set switchbuf=useopen,usetab
set complete=.,w,b,u,t,i,k
set completeopt=menuone
set omnifunc=syntaxcomplete#Complete
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
set hlsearch|nohlsearch
set sidescrolloff=5
set sidescroll=1
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set inccommand=nosplit
set updatetime=750
set clipboard^=unnamedplus,unnamed
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•
set statusline=%<%f\ %h%m%r%y%=%-14.(%l,%c%V%)\ %L

nnoremap <Esc><Esc> :nohlsearch<CR>
noremap j gj
noremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :<C-u>update<CR>
nnoremap <C-q> :<C-u>bw<CR>
inoremap <C-s> <Esc>:<C-u>update<CR>
vnoremap <C-s> <C-C>:<C-u>update<CR>
inoremap <C-z> <C-O>u
nnoremap H ^
nnoremap L $
vnoremap L g_
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent> <S-Tab>      :wincmd W<CR>
nnoremap <silent><expr> ,q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap <silent> <C-Up> :vertical resize +1<CR>
nnoremap <silent> <C-Down> :vertical resize -1<CR>
nnoremap vv viw
vnoremap . :normal .<CR>
nnoremap ,n :set invnumber<CR>
nnoremap ,w :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>

filetype plugin indent on
syntax on

colorscheme space-vim-dark

nnoremap - :packadd nerdtree<CR>:NERDTreeToggle<CR>
nnoremap <Leader>- :packadd nerdtree<CR>:NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 3

nnoremap <BS> :CtrlPBuffer<CR>
nnoremap ,m :CtrlPMRUFiles<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
      \   'dir': '\v[\/](bower_components|\node_modules|\.git)$',
      \ }

let g:ags_agexe = 'ag'
let g:ags_agcontext = 0
let g:ags_enable_async = 1
nnoremap ,f :Ags<CR>
nnoremap ,g :Ags<Space>

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 200
let g:ale_linters = {
      \ 'html': ['eslint']
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript'
      \}
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint']
      \ }
let g:ale_fix_on_save = 1
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1

com! PackClean     packadd minpac | call minpac#clean()
com! PackUpdate    packadd minpac | call minpac#clean() | call minpac#update()

nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
function! s:VSetSearch()
  let l:temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

nnoremap ,l :ls<CR>:b

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
AutoCmd BufEnter * packadd vim-repeat
AutoCmd BufEnter * packadd vim-surround
AutoCmd BufEnter * packadd vim-commentary
AutoCmd BufEnter * packadd cmdline-completion
AutoCmd FileType apache setlocal commentstring=#\ %s
AutoCmd FileType jinja setlocal commentstring={#\ %s\ \#}
AutoCmd FileType twig setlocal commentstring={#\ %s\ \#}
AutoCmd FileType twig.html setlocal commentstring={#\ %s\ \#}
AutoCmd FileType dosini setlocal commentstring=#\ %s
AutoCmd FileType vim,javascript,html,yaml,json,twig,ansible,scss packadd ale
AutoCmd BufReadPre *.j2 packadd Vim-Jinja2-Syntax
AutoCmd BufReadPre *.twig packadd vim-twig
AutoCmd BufReadPre *.html packadd html5.vim
AutoCmd BufReadPre *.yml packadd yaml-vim
AutoCmd BufReadPre *.js packadd yajs.vim
AutoCmd BufReadPre *.md packadd vim-markdown
AutoCmd BufReadPre *.fish packadd vim-fish
AutoCmd BufReadPre *.nginx packadd nginx.vim
AutoCmd BufReadPre *.coffee packadd vim-coffee-script
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
AutoCmd InsertLeave * set nopaste
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufRead *.yamllint setlocal filetype=yaml
AutoCmd BufRead *.editorconfig setlocal filetype=dosini
AutoCmd BufRead,BufNewFile *.html set filetype=html
