scriptencoding utf-8

" disable some internal plugins
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1

" general autogroup
augroup vimRc
  autocmd!
augroup END

" dein
let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('neoclide/coc.nvim', { 'build': 'yarn install --frozen-lockfile', 'merged': 0 })
  call dein#add('neoclide/coc-eslint', { 'build': 'yarn install --frozen-lockfile', 'merged': 0 })
  call dein#add('neoclide/coc-git', { 'build': 'yarn install --frozen-lockfile', 'merged': 0 })
  call dein#add('tpope/vim-vinegar', {
        \ 'on_map': {'n': '-'}
        \ })
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('sgur/vim-editorconfig', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('sgur/vim-editorconfig', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('tpope/vim-fugitive', {
        \ 'on_event': 'BufReadPost',
        \ })
  call dein#add('tpope/vim-dispatch', {
        \ 'on_cmd': ['Dispatch', 'Make', 'Start']
        \ })
  call dein#add('tpope/vim-surround', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('tpope/vim-repeat')
  call dein#add('tomtom/tcomment_vim', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('wellle/targets.vim', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('markonm/hlyank.vim', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('junegunn/vim-easy-align',{
        \ 'on_map': '<Plug>(EasyAlign)',
        \ 'on_cmd': 'EasyAlign'
        \ })
  call dein#add('stefandtw/quickfix-reflector.vim', {
        \ 'on_ft': 'qf'
        \ })
  call dein#add('arames/vim-async-grep', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('mbbill/undotree', {
        \ 'on_cmd': 'UndotreeToggle'
        \ })
  call dein#add('michaeljsmith/vim-indent-object', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('terryma/vim-multiple-cursors', {
        \ 'on_map': '<C-n>'
        \ })
  call dein#add('samoshkin/vim-mergetool', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('da-x/conflict-marker.vim', {
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('hotwatermorning/auto-git-diff', {
        \ 'on_ft': 'gitrebase'
        \ })
  call dein#add('pangloss/vim-javascript', {
        \ 'on_ft': 'javascript'
        \ })
  call dein#add('jonsmithers/vim-html-template-literals', {
        \ 'branch': 'dev',
        \ 'on_ft': 'javascript',
        \ 'hook_add': 'let g:htl_all_templates = 1'
        \ })
  call dein#add('LnL7/vim-nix', {
        \ 'on_ft': 'nix'
        \ })
  call dein#add('digitaltoad/vim-pug', {
        \ 'on_ft': 'pug'
        \ })
  call dein#add('dNitro/vim-pug-complete', {
        \ 'on_ft': 'pug'
        \ })
  call dein#add('rhysd/vim-fixjson', {
        \ 'on_ft': 'json'
        \ })
  call dein#add('kchmck/vim-coffee-script', {
        \ 'on_ft': 'coffee'
        \ })
  call dein#add('plasticboy/vim-markdown', {
        \ 'on_ft': 'markdown'
        \ })
  call dein#add('lepture/vim-jinja', {
        \ 'on_ft': 'jinja'
        \ })
  call dein#add('lumiliet/vim-twig', {
        \ 'on_ft': 'twig'
        \ })

  call dein#end()
  call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
filetype plugin indent on

if dein#tap('coc.nvim')
  nmap <silent> gld <Plug>(coc-definition)
  nmap <silent> gli <Plug>(coc-implementation)
  nmap <silent> glr <Plug>(coc-references)
  nmap <silent> glc <Plug>(coc-codeaction)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> [c <Plug>(coc-git-prevchunk)
  nmap <silent> ]c <Plug>(coc-git-nextchunk)
  nnoremap <silent> K :call CocAction('doHover')<cr>
  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
endif

if dein#tap('fzf.vim')
  let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  let g:fzf_layout = { 'down': '~25%' }
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit',
        \ 'ctrl-w': 'bdelete'}
  nnoremap <c-p> :Files<cr>
  nnoremap <c-h> :Files %:h<cr>
  nnoremap <bs> :Buffers<cr>
endif

if dein#tap('vim-vinegar')
  let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
  let g:netrw_altfile             = 1
  autocmd vimRc FileType netrw call functions#innetrw()
endif

if dein#tap('vim-surround')
  let g:surround_no_insert_mappings = 1
  let surround_indent=1
  nmap S ysiw
endif

if dein#tap('vim-editorconfig')
  let g:editorconfig_root_chdir = 1
  let g:editorconfig_verbose    = 1
  let g:editorconfig_blacklist  = {
        \ 'filetype': ['git.*', 'fugitive'],
        \ 'pattern': ['\.un~$']}
endif

if dein#tap('vim-fugitive')
  nnoremap [git]  <Nop>
  nmap <space>g [git]
  nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
  nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

  function! InFugitive() abort
    nmap <buffer> zp :<c-u>Dispatch! git push<CR>
    nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
  endfunction

  autocmd vimRc FileType fugitive call InFugitive()
endif

if dein#tap('vim-easy-align')
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endif

if dein#tap('undotree')
  let g:undotree_CustomUndotreeCmd = 'vertical 50 new'
  let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_ShortIndicators = 1
endif

" better defaults
set path& | let &path .= '**'
set gdefault
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set nobackup
set undofile
set inccommand=nosplit
set number
set mouse=a
set termguicolors
set shortmess+=aoOtTIc
set sidescrolloff=10
set sidescroll=1
set switchbuf+=useopen,usetab
set splitbelow
set splitright
set nowrap
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience,iwhite
set timeoutlen=3000
set updatetime=50
set wildmode=longest:full,full
set wildignore=
      \*.png,
      \*.jpg,
      \*.gif,
      \*.gem,
      \*.swp,
      \*.zip,
      \*.gz,
      \*/.DS_Store/*,
      \*/tmp/*,
      \*/node_modules/*,
      \*/bower_components/*,
      \*/vendor/*,
      \*/pack/*,
      \*/.gem/*,
      \*/.git/*,
      \*/.hg/*,
      \*/.svn/*
set wildcharm=<C-Z>
set noshowmode
set tabline=%!functions#tabline()
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:‡
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•

" grep
if executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" statusline
set statusline=
set statusline+=%<%{toupper(mode())}
set statusline+=%4c
set statusline+=\ %{expand('%:p:h:t')}
set statusline+=/%t
set statusline+=%h%r
set statusline+=\ %#error#
set statusline+=%{&modified?'+++++':''}
set statusline+=%*
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype:''}

" mappings
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :<c-u>update<cr>
inoremap <C-s> <esc>:update<cr>
xnoremap <C-s> <esc>:<C-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap } }zz
nnoremap { {zz

" tab complete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" windows
nnoremap <silent> <Tab> <c-w>w
nnoremap <silent> <S-Tab> <c-w>W

" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" word select
nnoremap vv viw

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

" disable EX-mode
nnoremap Q <Nop>

" execute macro
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>

" yank to clipboard
vnoremap <space>y "+y

" yank and keep cursor position
vnoremap <expr>y "my\"" . v:register . "y`y"

" paste from clipboard
nnoremap <space>p :put+<cr>
vnoremap <space>p "+p
nnoremap <space>P :put!+<cr>
vnoremap <space>P "+P

" Paste continuously.
nnoremap ]p viw"0p
vnoremap P "0p

" replace a word with clipboard
nnoremap <space>w viw"+p

" file finder
nnoremap <space>f :find<space>

" delete buffers
nnoremap <space>b :ls<cr>:bd<space>

" substitute.
nnoremap [subst] <Nop>
nmap   s [subst]
xmap   s [subst]
nnoremap [subst]s :%s/
nnoremap [subst]l :s//<left>
xnoremap [subst]  :s/
nnoremap [subst]a :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap [subst]p :'{,'}s//<left>
nnoremap [subst]w :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>
nnoremap [subst]n *``cgn

" zoom
nnoremap <C-w>t :tabedit %<cr>
nnoremap <C-w>z :tabclose<cr>

" git commands
nnoremap <silent> <expr> <space>dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"

" hlsearch
nnoremap <silent>n n
nnoremap <silent>N N

" star search
nnoremap <silent> * *N
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" CTRL-L to fix syntax highlight
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<cr>:nohlsearch<cr>"
nnoremap <silent> <space>n :Nohlsearch<cr>

" toggles
nnoremap cos
      \ :<C-u>call functions#toggle_option('spell')<CR>
nnoremap cow
      \ :<C-u>call functions#toggle_option('wrap')<CR>
nnoremap con
      \ :<C-u>call functions#toggle_option('relativenumber')<CR>
nnoremap col
      \ :<C-u>call functions#toggle_option('cursorline')<CR>
nnoremap coc
      \ :<C-u>call functions#toggle_option('cursorcolumn')<CR>
nnoremap cof
      \ :<C-u>call functions#togglefixonsave()<CR>

" autocmds
" If a file is large, disable syntax highlighting, filetype etc
let g:LargeFile = 20*1024*1024 " 20MB
autocmd vimRc BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

" don't list location-list / quickfix windows
autocmd vimRc BufReadPost quickfix setlocal nobuflisted
autocmd vimRc BufReadPost quickfix nnoremap <buffer> gq :bd<CR>
autocmd vimRc FileType help nnoremap <buffer> gq :bd<CR>
autocmd vimRc CmdwinEnter * nnoremap <silent><buffer> gq :<C-u>quit<CR>

" grep.
autocmd vimRc QuickFixCmdPost cgetexpr cwindow

" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif
autocmd vimRc BufEnter * if &diff | call functions#diff_maps() | endif

" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

" mkdir
autocmd vimRc BufWritePre *
      \ if !isdirectory(expand('%:h', v:true)) |
      \   call mkdir(expand('%:h', v:true), 'p') |
      \ endif

" kepp cursor position
autocmd vimRc BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

" fugitive files
autocmd vimRc FileType git setlocal nofoldenable

" fix insert leave
autocmd vimRc InsertLeave * call functions#insertleave()

" hlsearch
autocmd vimRc CursorMoved,InsertLeave * call functions#highlight_current()

" filetype
autocmd vimRc FileType javascript call functions#lspconfig()
autocmd vimRc FileType typescript call functions#lspconfig()
autocmd vimRc FileType vim call functions#lspconfig()
autocmd vimRc BufNewFile,BufRead *.jsx setlocal filetype=javascript
autocmd vimRc BufReadPre,BufNewFile *.tsx setlocal filetype=typescript
autocmd vimRc BufNewFile,BufRead *.twig setlocal filetype=html.twig
autocmd vimRc BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
autocmd vimRc BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal formatoptions=

" commands
command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! BD setlocal bufhidden=delete | bnext
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! HL call functions#hl()

syntax enable
silent! colorscheme hydrangea
