scriptencoding utf-8
augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd MyVimrc <args>

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AutoCmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/context_filetype.vim'
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'lumiliet/vim-twig', { 'for': ['twig', 'html.twig'] }
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'pocke/iro.vim', { 'for': ['yaml', 'ruby'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'shougo/deoplete.nvim'
Plug 'gabesoft/vim-ags'
call plug#end()

"Colours"
set termguicolors
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:gruvbox_invert_selection = 0
let g:gruvbox_invert_indent_guides = 1
set background=dark

"Options"
set shell=/bin/sh
set autoread
set noswapfile
set mouse=a
set hidden
set nofoldenable
set splitbelow
set splitright
set nostartofline
set equalalways
set fillchars+=diff:⣿
set diffopt=vertical
set diffopt+=filler
set diffopt+=iwhite
set complete=.,w,b,u,t,i
set completeopt+=noselect
set completeopt+=noinsert
set omnifunc=syntaxcomplete#Complete
set infercase
set ignorecase
set smartcase
set hlsearch|nohlsearch
set number
set numberwidth=1
set cursorline
set nowrap
set showbreak=\\\
set smarttab
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus
set list listchars=space:·,tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<,nbsp:•
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"Mappings"
nnoremap <Esc><Esc> :nohlsearch<CR>
noremap j gj
noremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :<C-u>update<CR>
nnoremap <C-q> :<C-u>bw<CR>
inoremap <C-s> <Esc>:<C-u>update<CR>
vnoremap <C-s> <C-C>:<C-u>update<CR>
inoremap <C-z> <C-o>u
nnoremap H ^
nnoremap L $
vnoremap L g_
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent> <S-Tab>      :wincmd W<CR>
nnoremap <silent><expr> ,q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap <silent> <C-Up> :vertical resize +1<CR>
nnoremap <silent> <C-Down> :vertical resize -1<CR>
nnoremap vv viw
vnoremap <Space> <esc>
vnoremap . :normal .<CR>
nnoremap ,n :set invnumber<CR>
nnoremap <F9> :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>

"Plugins"
"editorconfig"
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
"nerdtree"
nnoremap - :NERDTreeToggle<CR>
nnoremap <Leader>- :NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMouseMode = 3

"ale lint"
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}
" let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
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
let g:ale_lint_delay = 1000
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

" autocomplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" star search
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
function! s:VSetSearch()
  let l:temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

"ctrlp"
nnoremap <BS> :CtrlPBuffer<CR>
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

"ags search"
nnoremap ,f :Ags<CR>
nnoremap ,g :Ags<Space>

" autocommands
AutoCmd BufEnter * :syntax sync fromstart
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
if !has('gui_running')
  AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
endif
AutoCmd FileType apache setlocal commentstring=#\ %s
AutoCmd FileType jinja setlocal commentstring={#\ %s\ \#}
AutoCmd FileType twig setlocal commentstring={#\ %s\ \#}
AutoCmd FileType twig.html setlocal commentstring={#\ %s\ \#}
AutoCmd FileType dosini setlocal commentstring=#\ %s
AutoCmd FileType editorconfig setlocal commentstring=#\ %s
AutoCmd BufRead,BufNewFile *.sql set list! cursorline!
AutoCmd BufRead *.yamllint setlocal filetype=yaml
AutoCmd BufRead *.editorconfig setlocal filetype=dosini
