if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

scriptencoding utf-8
set shell=/bin/sh
augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd MyVimrc <args>

if empty(glob('~/.config/nvim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
endif

set packpath^=~/.config/nvim
silent! packadd minpac

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  " theme
  call minpac#add('liuchengxu/space-vim-dark')

  " files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim', {'type': 'opt'})

  " git
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('airblade/vim-gitgutter')

  " syntax
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('lumiliet/vim-twig', {'type': 'opt'})
  call minpac#add('othree/html5.vim', { 'type': 'opt' })
  call minpac#add('gabrielelana/vim-markdown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})
  call minpac#add('aliva/vim-fish', { 'type': 'opt' })
  call minpac#add('pocke/iro.vim', { 'type': 'opt' })
  call minpac#add('kchmck/vim-coffee-script', { 'type': 'opt' })
  call minpac#add('othree/yajs.vim', { 'type': 'opt' })

  " enhancemets
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('sgur/vim-editorconfig')

  " linter
  call minpac#add('w0rp/ale', { 'type': 'opt' })

  " search
  call minpac#add('gabesoft/vim-ags', { 'type': 'opt' })
  call minpac#add('eugen0329/vim-esearch')

endif

com! PackClean     packadd minpac | call minpac#clean()
com! PackUpdate    packadd minpac | call minpac#clean() | call minpac#update()

set noswapfile
set shortmess=atI
set mouse=a
set hidden
set nofoldenable
set splitbelow
set splitright
set switchbuf=useopen,usetab
set nostartofline
set equalalways
set fillchars=diff:-,vert:\│
set diffopt=vertical
set diffopt+=filler
set diffopt+=iwhite
set complete=.,w,b,u,t,i,k
set completeopt+=noselect
set completeopt+=noinsert
set infercase
set omnifunc=syntaxcomplete#Complete
set noignorecase
set smartcase
set hlsearch|nohlsearch
set number
set cursorline
set sidescrolloff=5
set sidescroll=1
set linebreak
set showbreak=\\\
set breakat=\ \ ;:,!?
set nowrap
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set inccommand=nosplit
set updatetime=1000
set clipboard=unnamedplus
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•

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
nnoremap ,x :tabnext<CR>
nnoremap ,z :tabprevious<CR>
nnoremap ,1 1gt
nnoremap ,2 2gt
nnoremap ,3 3gt
nnoremap ,4 4gt
nnoremap ,5 5gt

filetype plugin on
filetype indent on
syntax on

colorscheme space-vim-dark

nnoremap - :packadd nerdtree<CR>:NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 3

command! Ctrlp packadd ctrlp.vim
nnoremap <C-p> :Ctrlp<CR>:CtrlP<CR>
nnoremap <BS> :Ctrlp<CR>:CtrlPBuffer<CR>
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 600
let g:ale_linters = {
      \ 'html': ['eslint'],
      \ 'twig': ['eslint'],
      \ 'html.twig': ['eslint']
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript',
      \ 'twig': 'javascript',
      \ 'html.twig': 'javascript'
      \}
let g:ale_fixers = {
      \ 'html': ['eslint'],
      \ 'javascript': ['eslint'],
      \ 'scss': ['prettier'],
      \ 'css': ['prettier'],
      \ 'json': ['prettier'],
      \ 'python': ['autopep8']
      \ }
let g:ale_fix_on_save = 1
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if !has('gui_running')
  AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
endif

AutoCmd BufEnter * packadd vim-repeat
AutoCmd BufEnter * packadd vim-surround
AutoCmd BufEnter * packadd vim-commentary
AutoCmd BufEnter * packadd vim-fish
AutoCmd FileType apache setlocal commentstring=#\ %s
AutoCmd FileType jinja setlocal commentstring={#\ %s\ \#}
AutoCmd FileType twig setlocal commentstring={#\ %s\ \#}
AutoCmd FileType twig.html setlocal commentstring={#\ %s\ \#}
AutoCmd FileType dosini setlocal commentstring=#\ %s
AutoCmd FileType vim,javascript,html,yaml,json,twig,ansible,scss packadd ale
AutoCmd BufReadPre *.j2 packadd Vim-Jinja2-Syntax
AutoCmd BufReadPre *.twig packadd vim-twig
AutoCmd BufReadPre *.html packadd html5.vim
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
AutoCmd InsertLeave * set nopaste
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufRead *.yamllint setlocal filetype=yaml
AutoCmd BufRead *.editorconfig setlocal filetype=dosini
AutoCmd BufRead,BufNewFile *.html set filetype=html
