scriptencoding utf-8

" general autogroup
augroup vimRc
  autocmd!
augroup END

" neobundle
let s:plugins_dir = expand('$HOME/.config/nvim/plugins')
if has('vim_starting')
  if &runtimepath !~# '/neobundle.vim'
    if ! isdirectory(s:plugins_dir.'/neobundle.vim')
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:plugins_dir.'/neobundle.vim'
    endif
    execute 'set runtimepath^='.s:plugins_dir.'/neobundle.vim'
  endif
endif

call neobundle#begin(expand('~/.config/nvim/plugins/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleLazy 'tpope/vim-vinegar', {
      \   'autoload': {
      \     'mappings': ['-']}}

NeoBundle 'Yggdroot/LeaderF', {
      \ 'lazy': 1,
      \ 'mappings': [['n', '<Plug>', '<c-p>']],
      \ 'on_cmd': ['Leaderf', 'LeaderfFile', 'LeaderfBuffer'],
      \ }

NeoBundle 'dense-analysis/ale', {
      \ 'lazy': 1,
      \ 'on_ft': ['vim', 'javascript', 'nix', 'html', 'typescript'],
      \ }

NeoBundleLazy 'Shougo/deoplete.nvim', {
      \   'on_i': 1,
      \ }

NeoBundleLazy 'sgur/vim-editorconfig'
NeoBundleLazy 'tpope/vim-fugitive'
NeoBundleLazy 'airblade/vim-gitgutter'
NeoBundleLazy 'tpope/vim-dispatch', {
      \ 'on_cmd': ['Dispatch', 'Make', 'Start'],
      \ }

NeoBundle 'tpope/vim-repeat'
NeoBundleLazy 'tpope/vim-surround', {
      \ 'mappings': [['n', 'ys', 'ds', 'cs'], ['x', 'S']],
      \ }

NeoBundle 'tomtom/tcomment_vim', {
      \ 'lazy': 1,
      \ 'mappings': [['nx', 'gc', 'gC']],
      \ }

NeoBundle 'markonm/hlyank.vim'
NeoBundle 'stefandtw/quickfix-reflector.vim'

NeoBundleLazy 'pangloss/vim-javascript', {
      \ 'on_ft': 'javascript'
      \ }

NeoBundleLazy 'jonsmithers/vim-html-template-literals', {
      \ 'branch': 'dev',
      \ 'on_ft': 'javascript'
      \ }

NeoBundleLazy 'LnL7/vim-nix', {
      \ 'on_ft': 'nix'
      \ }

NeoBundleLazy 'digitaltoad/vim-pug', {
      \ 'on_ft': 'pug'
      \ }

NeoBundleLazy 'dNitro/vim-pug-complete', {
      \ 'on_ft': 'pug'
      \ }

call neobundle#end()
filetype plugin indent on

if neobundle#is_installed('vim-vinegar')
  let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
  let g:netrw_altfile             = 1
  autocmd vimRc FileType netrw call functions#innetrw()

endif

if neobundle#tap('LeaderF')
  function! neobundle#hooks.on_source(bundle)
    let g:Lf_ShortcutF = '<C-P>'
    let g:Lf_ShortcutB = '<BS>'
    let g:Lf_WindowHeight = 0.25
    let g:Lf_PreviewInPopup = 1
    let g:Lf_PreviewHorizontalPosition = 'center'
    let g:Lf_CursorBlink = 0
    let g:Lf_ShowHidden = 1
    let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
  endfunction

  call neobundle#untap()
endif

if neobundle#tap('ale')
  let g:ale_set_signs = 1
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_delay = 0
  let g:ale_code_actions_enabled = 1
  let g:ale_sign_info = '_i'
  let g:ale_sign_error = '_e'
  let g:ale_sign_warning = '_w'
  let g:ale_set_balloons = 1
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
  let g:ale_echo_msg_format = '%linter%: %s %severity%'
  let g:ale_linters = {
        \   'jsx': ['eslint'],
        \   'javascript': ['eslint'],
        \   'typescript': ['eslint'],
        \}
  let g:ale_fixers = {
        \   'javascript': ['prettier', 'eslint'],
        \   'html': ['prettier', 'eslint'],
        \   'yaml': ['prettier'],
        \   'nix': ['nixpkgs-fmt']
        \}

  nnoremap [a :ALEPreviousWrap<CR>
  nnoremap ]a :ALENextWrap<CR>

  call neobundle#untap()
endif

if neobundle#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1

  call neobundle#untap()
endif

if neobundle#tap('vim-surround')
  let g:surround_no_insert_mappings = 1
  let surround_indent=1
  nmap S ysiw
endif

if neobundle#tap('vim-editorconfig')
  let g:editorconfig_root_chdir = 1
  let g:editorconfig_verbose    = 1
  let g:editorconfig_blacklist  = {
        \ 'filetype': ['git.*', 'fugitive'],
        \ 'pattern': ['\.un~$']}
  function! s:load_editorconfig()
    if findfile('.editorconfig', '.;') !=# ''
      NeoBundleSource vim-editorconfig
    endif
  endfunction

  autocmd vimRc BufReadPre * call s:load_editorconfig()

  call neobundle#untap()
endif

if neobundle#tap('vim-fugitive')
  if finddir('.git/') !=# ''
    NeoBundleSource vim-fugitive
  endif

  nnoremap [git]  <Nop>
  nmap <space>g [git]
  nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
  nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

  function! InFugitive() abort
    nmap <buffer> zp :<c-u>Dispatch! git push<CR>
    nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
  endfunction

  autocmd vimRc FileType fugitive call InFugitive()

  call neobundle#untap()
endif

if neobundle#tap('vim-gitgutter')
  if finddir('.git/') !=# ''
    NeoBundleSource vim-gitgutter
  endif

  call neobundle#untap()
endif

if neobundle#tap('vim-html-template-literals')
  let g:htl_all_templates = 1
  let g:htl_css_templates = 1

  call neobundle#untap()
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
set sidescrolloff=10
set sidescroll=1
set switchbuf+=useopen,usetab
set splitbelow
set splitright
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set updatetime=50
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
set laststatus=2
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

" Smart <C-f>, <C-b>.
nnoremap <expr> <C-f> max([winheight(0) - 2, 1])
      \ . "\<C-d>" . (line('w$') >= line('$') ? "L" : "M")
nnoremap <expr> <C-b> max([winheight(0) - 2, 1])
      \ . "\<C-u>" . (line('w0') <= 1 ? "H" : "M")

" windows
nnoremap <silent> <Tab> <c-w>w
nnoremap <silent> <S-Tab> <c-w>W

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

" Better x
nnoremap x "_x

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
nnoremap <silent> * *``
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
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | GitGutter | endif

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

" hlsearch
autocmd vimRc CursorMoved,InsertLeave * call functions#highlight_current()
autocmd vimRc InsertEnter * ClearCurrentSearch

" filetype
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
command! -nargs=0 Nixfmt Dispatch! nixfmt %
command! -bang -nargs=* -complete=file Grep call functions#grep('grep<bang>',<q-args>)
command! HL call functions#hl()

syntax enable
silent! colorscheme min
