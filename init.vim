scriptencoding utf-8
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

let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1


nnoremap - :packadd nerdtree<CR>:NERDTreeToggle<CR>
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1

nmap <Leader>f :LustyFilesystemExplorer<CR>
nmap <Leader>r :LustyFilesystemExplorerFromHere<CR>
nmap <Leader>b :LustyBufferExplorer<CR>
nmap <Leader>g :LustyBufferGrep<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap ,f :Ags<CR>
nnoremap ,g :Ags<Space>

function! s:VSetSearch()
  let l:temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
