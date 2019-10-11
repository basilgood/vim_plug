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

let g:loaded_matchparen         = 1
let g:loaded_rrhelper           = 1
let g:did_install_default_menus = 1
let g:is_bash                   = 1
let g:sh_noisk                  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logipat            = 1
let g:loaded_man                = 1

let $CACHE      = expand('$HOME/.cache/')
let $CACHE_NVIM = expand('$CACHE/nvim')
let $NVIM_PATH  = expand('~/.config/nvim')

source $HOME/.config/nvim/minpac.vim

Pac 'neoclide/coc.nvim', {'type': 'opt', 'branch': 'release', 'lazy': 1}
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-stylelintplus',
      \ 'coc-html',
      \ 'coc-svelte',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ 'coc-webpack',
      \ 'coc-yank'
      \ ]

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
nmap gm <Plug>(coc-git-commit)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ functions#check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

command! -nargs=0 Format :call CocAction('format')

Pac 'mhinz/vim-startify'
nnoremap [Space]q :SC<cr>
let g:startify_files_number        = 5
let g:startify_change_to_dir       = 0
let g:startify_enable_special      = 0
let g:startify_update_oldfiles     = 1
let g:startify_session_dir         = '~/.cache/nvim/session'
let g:startify_bookmarks = []
let g:startify_custom_header = []
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   Recent files'] },
      \ { 'type': 'sessions',  'header': ['   Sessions'], 'indices': ['A','B','C'] },
      \ ]

function! s:save_session() abort
  if !empty(v:this_session) && get(g:, 'startify_session_persistence')
    call startify#session_write(v:this_session)
  endif
endfunction

autocmd BufNewFile,BufAdd,BufDelete,BufLeave * call s:save_session()

Pac 'tpope/vim-vinegar', { 'type': 'opt', 'lazy': 1 }
let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
autocmd vimRc FileType netrw call functions#innetrw()

Pac 'junegunn/fzf', { 'type': 'opt', 'cmd': ['Files', 'Buffers'] }
Pac 'junegunn/fzf.vim', { 'type': 'opt', 'cmd': ['Files', 'Buffers'] }
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>
call fz_f#fzf()

Pac 'mhinz/vim-startify'
Pac 'tpope/vim-fugitive', { 'type': 'opt' }
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<CR>
nnoremap <silent> [fugitive]C :<C-u>Gcommit --amend<CR>
nnoremap <silent> [fugitive]a :<C-u>Dispatch! git add %<CR>
nnoremap <silent> [fugitive]r :<C-u>Dispatch! git reset %<CR>
nnoremap <silent> [fugitive]D :<C-u>Dispatch! git checkout -- %<CR>
nnoremap <silent> [fugitive]p :<C-u>Dispatch! git push<CR>
nnoremap <silent> [fugitive]P :<C-u>Dispatch! git push -f<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Gitv --all<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zf :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

Pac 'gregsexton/gitv', { 'type': 'opt', 'cmd': 'Gitv' }
Pac 'hotwatermorning/auto-git-diff', { 'type': 'opt' }
Pac 'Tiancheng-Luo/conflict3', { 'type': 'opt' }
function! s:enable_git_plugins() abort
  if system('git rev-parse --is-inside-work-tree') =~# '\m\C^true'
    packadd vim-fugitive
    packadd gitv
    packadd auto-git-diff
    packadd conflict3
  endif
endfunction
autocmd! vimRc BufReadPre * call s:enable_git_plugins()

Pac 'sgur/vim-editorconfig', { 'type': 'opt', 'lazy': 1 }

let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}
autocmd vimRc BufReadPre * silent execute 'packadd' . ' vim-editorconfig'

Pac 'tpope/vim-repeat', { 'type': 'opt', 'lazy': 1 }
Pac 'tpope/vim-dispatch', { 'type': 'opt', 'lazy': 1 }
Pac 'tomtom/tcomment_vim', { 'type': 'opt', 'lazy': 1 }

Pac 'tpope/vim-surround', { 'type': 'opt', 'lazy': 1 }
let g:surround_no_insert_mappings = 1
let surround_indent=1
nmap S ysiw
autocmd vimRc BufRead * silent execute 'packadd' . ' vim-surround'

Pac 'embear/vim-localvimrc', { 'type': 'opt', 'lazy': 1 }
let g:localvimrc_ask = 0

Pac 'junegunn/vim-easy-align', { 'type': 'opt', 'lazy': 1 }
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

Pac 'itchyny/vim-parenmatch', { 'type': 'opt', 'lazy': 1 }

Pac 'wellle/targets.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'delphinus/vim-auto-cursorline', { 'type': 'opt', 'lazy': 1 }
Pac 'gcmt/wildfire.vim', { 'type': 'opt', 'lazy': 1 }
let g:wildfire_objects = [ 'iw', 'il', "i'", "a'", 'i"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'i<', 'a<', 'ip', 'it']
let g:wildfire_fuel_map = '+'
let g:wildfire_water_map = '-'
nmap <leader>s <Plug>(wildfire-quick-select)

Pac 'stefandtw/quickfix-reflector.vim', { 'type': 'opt', 'lazy': 1 }

Pac 'haya14busa/vim-edgemotion', { 'type': 'opt', 'lazy': 1 }
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

Pac 'michaeljsmith/vim-indent-object', { 'type': 'opt', 'lazy': 1 }

Pac 'sgur/cmdline-completion', { 'type': 'opt' }
autocmd vimRc CmdlineEnter * packadd cmdline-completion

Pac 'gabesoft/vim-ags', { 'type': 'opt', 'cmd': 'Ags' }
let g:ags_winplace = 'right'

Pac 'mbbill/undotree', { 'type': 'opt', 'cmd': 'UndotreeToggle' }
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>
autocmd vimRc BufRead * silent execute 'packadd' . ' undotree'

Pac 'kana/vim-submode', {'type': 'opt'}
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

Pac 'neoclide/jsonc.vim'
Pac 'lumiliet/vim-twig', {'type': 'opt', 'ft': 'twig'}
Pac 'lepture/vim-jinja', {'type': 'opt', 'ft': 'jinja2'}
Pac 'MaxMEllon/vim-jsx-pretty', {'type': 'opt', 'ft': ['javascript', 'javascript.jsx']}
Pac 'HerringtonDarkholme/yats.vim', {'type': 'opt', 'ft': ['typescript', 'typescript.tsx']}
Pac 'plasticboy/vim-markdown', {'type': 'opt', 'ft': 'markdown'}
Pac 'kchmck/vim-coffee-script', {'type': 'opt', 'ft': 'coffee'}
Pac 'elzr/vim-json', {'type': 'opt', 'ft': 'json'}
Pac 'stephpy/vim-yaml', {'type': 'opt', 'ft': ['yml', 'yaml']}
Pac 'evanleck/vim-svelte', {'type': 'opt', 'ft': 'svelte'}

" general settings / options
set path=.,**
set undofile
set nobackup
set noswapfile
set expandtab shiftwidth=2 softtabstop=-1
set fileformats=unix,dos
let g:sh_noisk = 1
set termguicolors
set number
set mouse=a
set cursorline
set lazyredraw
set noswapfile
set shortmess+=Icm
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set signcolumn=yes
set tabline=%!functions#tabline()
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt+=menuone,noselect
set completeopt-=preview
set complete=.,w,b,u,U,t,i,d,k
set pumheight=12
set gdefault
set hlsearch|nohlsearch
set nostartofline
set sidescrolloff=5
set sidescroll=1
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set diffopt+=context:3,indent-heuristic,algorithm:patience
set inccommand=nosplit
set timeoutlen=3000
set updatetime=300
set wildmode=longest:full,full
set helplang=en
set nospell
set spelllang=en_us
set fileformats=unix,dos,mac
let s:mkdir = function('mkdir')
set undodir=~/.cache/nvim/undo
call s:mkdir(&undodir, 'p')
set undofile
set list
let &g:listchars = 'tab:▸ ,trail:•,extends:❯,precedes:❮,nbsp:⦸'
augroup list_trail
  autocmd InsertEnter * set listchars-=trail:•
  autocmd InsertLeave * set listchars+=trail:•
augroup END

let &g:statusline=''
let &g:statusline.='%{expand("%:p:h:t")}/%t'
let &g:statusline.='%8c:%l'
let &g:statusline.=' %h%r'
let &g:statusline.='%{exists("g:did_coc_loaded")?coc#status():""}'
let &g:statusline.=' %#incsearch#%{&mod?" ✚✚✚ ":""}'
let &g:statusline.='%*'
let &g:statusline.='%='
let &g:statusline.='%{exists("g:loaded_fugitive")?fugitive#head(5):""} '
let &g:statusline.='[%{&filetype!=#""?&filetype:""}]'

" mappings
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <c-s> :<c-u>update<cr>
inoremap <c-s> <esc>:update<cr>
xnoremap <c-s> <esc>:<c-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>
nnoremap }   }zz
nnoremap {   {zz

" windows
nnoremap <silent> <Tab> :call functions#nextwindow()<CR>
nnoremap <silent> <S-Tab> :call functions#previouswindowortab()<CR>

" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" niceblock
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')

" innerline
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>

" entire
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

" disable EX-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" execute macro
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>

" search and star search
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap cn :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
nnoremap dn :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
vnoremap * :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>

" cmdwinenter
nnoremap <leader><leader> q:

" grep
nnoremap gr :<C-u>Grep<Space>

" commands history
nnoremap <leader>] :CmdHist<cr>

" smart space mapping
nmap <Space> [Space]
nnoremap  [Space] <Nop>
vmap <Space> [Space]
vnoremap  [Space] <Nop>

" yank from cursor position to end of line
nnoremap Y y$

" yank to clipboard
vnoremap [Space]y "+y

" paste from clipboard
nnoremap [Space]p :put+<cr>
vnoremap [Space]p "+p
nnoremap [Space]P :put!+<cr>
vnoremap [Space]P "+P

" Paste continuously.
nnoremap [p "0p
nnoremap ]p viw"0p
vnoremap P "0p

" replace a word with clipboard
nnoremap [Space]w viw"+p

" switch buffers
nnoremap [Space]1 1<c-w>w
nnoremap [Space]2 2<c-w>w

nnoremap [Space]3 3<c-w>w
nnoremap [Space]4 4<c-w>w
nnoremap [Space]5 5<c-w>w
nnoremap [Space]6 6<c-w>w
nnoremap [Space]7 7<c-w>w
nnoremap [Space]8 8<c-w>w
nnoremap [Space]9 9<c-w>w

" substitute.
nnoremap [Substitute]   <Nop>
nmap   s [Substitute]
xmap   s [Substitute]
nnoremap [Substitute]s :%s/
nnoremap [Substitute]l :s/
xnoremap [Substitute]  :s/
nnoremap [Substitute]a :%s/\<<c-r><c-w>\>/<c-r><c-w>
nnoremap [Substitute]p vip :s/
nnoremap [Substitute]w :%s/\<<c-r><c-w>\>/

" zoom
nnoremap <C-w>t :tabedit %<cr>
nnoremap <C-w>z :tabclose<cr>
nnoremap <silent> <S-tab> :tabnext<CR>

" git commands
nnoremap <silent> <expr> [Space]dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"

" completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ functions#check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

" sessions
nnoremap [Space]s :call sessions#load()<cr>

" hlsearch
augroup hlsearch
  autocmd!
  " trigger when hlsearch is toggled
  autocmd OptionSet hlsearch call <SID>toggle(v:option_old, v:option_new)
augroup END

function! s:StartHL()
  silent! if v:hlsearch && !search('\%#\zs'.@/,'cnW')
  call <SID>StopHL()
endif
endfunction

function! s:StopHL()
  if ! v:hlsearch || mode() !=? 'n'
    return
  else
    silent call feedkeys("\<Plug>(StopHL)", 'm')
  endif
endfunction

function! s:toggle(old, new)
  if a:old == 0 && a:new == 1
    " nohls --> hls
    "   set up
    noremap  <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
    noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

    autocmd hlsearch CursorMoved * call <SID>StartHL()
    autocmd hlsearch InsertEnter * call <SID>StopHL()
  elseif a:old == 1 && a:new == 0
    " hls --> nohls
    "   tear down
    nunmap <expr> <Plug>(StopHL)
    unmap! <expr> <Plug>(StopHL)

    autocmd! hlsearch CursorMoved
    autocmd! hlsearch InsertEnter
  else
    " nohls --> nohls
    "   do nothing
    return
  endif
endfunction

call <SID>toggle(0, &hlsearch)

" hlnext
nnoremap <silent> n nzz:call functions#hlnext()<cr>
nnoremap <silent> N Nzz:call functions#hlnext()<cr>
nnoremap <silent> [Space]n :nohlsearch<CR>

" autocmds
call autocmds#autocmds()
call commands#commands()

set background=dark
silent! colorscheme kolor
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
