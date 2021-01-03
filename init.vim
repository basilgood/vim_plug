scriptencoding utf-8
augroup vimRc
  autocmd!
augroup end

" plug and config
lua require('plugins')
lua require('plugadd')
lua require('plug-lualine')
lua require('fzf')
lua require('lspfuzzy').setup {}

autocmd vimRc CmdlineEnter *
      \ packadd undotree |
      \ packadd diffconflicts

" completion and lsp
lua << EOF
vim.cmd('packadd! nvim-lspconfig')
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <space>; <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <space>, <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>

autocmd vimRc Filetype javascript,typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd vimRc BufEnter * lua require'completion'.on_attach()
let g:completion_auto_change_source = 1
let g:completion_matching_strategy_list =['exact', 'substring', 'fuzzy']
let g:completion_chain_complete_list = {
      \ 'default': [
      \    {'complete_items': ['path'], 'triggered_only': ['/']},
      \    {'complete_items': ['lsp', 'buffers']},
      \    {'mode': '<c-n>'}
      \]
      \}

" interactive
nmap gw :InteractiveWindow<CR>

" neomake
let g:neomake_virtualtext_current_error = 0
let g:neomake_highlight_columns = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:gitgutter_sign_priority = 8
nnoremap ]a :NeomakeNextLoclist<cr>
nnoremap [a :NeomakePrevLoclist<cr>
autocmd! vimRc BufReadPost * call neomake#configure#automake('nrwi', 500)

" asterisk
let g:asterisk#keeppos = 1
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" gitgutter
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" fugitive
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<cr>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<cr>gg']

" netrw
let g:netrw_bufsettings =
      \ 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile = 1
let g:netrw_altv = 1
let g:netrw_alto = 0
let g:netrw_preview = 1
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_use_errorwindow = 0
let g:netrw_list_hide = '^\.*/$'
function! s:innetrw() abort
  nmap <buffer><silent> <right> <cr>
  nmap <buffer><silent> <left> -
  nmap <buffer><silent> J j<cr>
  nmap <buffer><silent> K k<cr>
endfunction
autocmd vimRc FileType netrw call s:innetrw()
nnoremap <silent> -
      \ :Explore <bar> :silent! /<c-r>=expand("%:t")<cr><cr>:nohl<cr>

" undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" polyglot
let g:polyglot_disabled = ['autoindent', 'sensible']

" personal options my editor
lua require('options')

" mappings
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-Y>" : "\<CR>"
nnoremap Z :update<cr>
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap } }zz
nnoremap { {zz
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]L :llast<cr>
nnoremap [L :lfirst<cr>
" copy paragraph
nnoremap cp yap<S-}>p
" objects: block. line, entire
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
" textobj-lastchanged
noremap <silent> gm :<C-u>normal! v`[o`]<CR>
" copy / paste
nmap  <Space>   [Space]
vmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap <silent> [Space]y y:call system("wl-copy", @")<cr>
nnoremap [Space]p :let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>:put<cr>
nnoremap [Space]w diw:let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>P
xnoremap [Space]p d:let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>P
vnoremap P "0p
" substitute
nnoremap ss :%s/
nnoremap sl :s/
xnoremap s  :s/
nnoremap sa :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sw :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>
" search and replace
nnoremap sn :<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>cgn
" diff two buffers
nnoremap <silent> <expr> [Space]dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
" c-g improved
nnoremap <silent> <C-g> :file<Bar>echon ' ' system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")<CR>
" reload syntax and nohl
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<cr>:nohlsearch<cr>"
" execute macro
nnoremap Q <Nop>
nnoremap Q @q
vnoremap Q :norm Q<cr>
" find and buffers
nnoremap [Space]f :find<space>
nnoremap [Space]b :b<space><c-z>
" jump to window no
for i in range(1, 9)
  execute 'nnoremap [Space]'.i.' :'.i.'wincmd w<CR>'
endfor
execute 'nnoremap [Space]0 :wincmd p<CR>'
" jump to tab no
for i in range(1, 9)
  execute 'nmap <M-' . i . '> ' . i . 'gt'
endfor
" terminal
tmap <C-o> <C-\><C-n>

" autocmds
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=500}
augroup END
" large files
let g:large_file = 20*1024*1024 " 20MB
autocmd vimRc BufReadPre *
      \ let f=expand("<afile>") |
      \ if getfsize(f) > g:large_file |
      \ set eventignore+=FileType |
      \ setlocal noswapfile bufhidden=unload undolevels=-1 |
      \ else |
      \ set eventignore-=FileType |
      \ endif
" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end
" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif
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
" external changes
autocmd vimRc FocusGained,CursorHold *
      \ if !bufexists("[Command Line]") |
      \ checktime |
      \ if exists('g:loaded_gitgutter') |
      \   call gitgutter#all(1) |
      \ endif
" filetype
autocmd vimRc BufNewFile,BufRead *.jsx setlocal filetype=javascript
autocmd vimRc BufReadPre,BufNewFile *.tsx setlocal filetype=typescript
autocmd vimRc BufNewFile,BufRead *.twig setlocal filetype=html.twig
autocmd vimRc BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
autocmd vimRc BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
autocmd vimRc BufNewFile,BufRead config setlocal filetype=config
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal formatoptions=
" format
autocmd vimRc FileType nix setlocal makeprg=nix-instantiate\ --parse
autocmd vimRc FileType nix setlocal formatprg=nixpkgs-fmt
autocmd vimRc BufRead,BufNewFile *.nix command! F silent call system('nixpkgs-fmt ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! F silent call system('prettier --single-quote --write ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx command! Fix silent call system('eslint --fix ' . expand('%'))
autocmd vimRc FileType yaml command! F silent call system('prettier --write ' . expand('%'))
autocmd vimRc FileType sh command! F silent call system('shfmt -i 2 -ci -w ' . expand('%'))

" commands
command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command BD bp | bd #
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 WT %s/[^\t]\zs\t\+/ / | normal! ``
command! HL echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<'
      \ . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<'
      \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
command! WW w !sudo tee % > /dev/null
command! -nargs=1 TV
      \ call system('tmux split-window -h '.<q-args>)
command! TA TV tig --all
command! TS TV tig status
command! -bang -nargs=* -complete=file Make
      \ call asyncdo#run(1, &makeprg, <f-args>)
command! -bang -nargs=* -complete=file LMake
      \ call asyncdo#lrun(1, &makeprg, <f-args>)
command! -bang -nargs=+ -complete=file Grep
      \ call asyncdo#run(1, {'job': &grepprg, 'errorformat': &grepformat}, <f-args>) |
      \ let @/=split("<args>")[0] |
      \ call feedkeys(":let &hlsearch=1\<CR>", "n") |
      \ copen |
      \ redraw!
command! -nargs=0 InstallPaq call functions#install_paq()
command! InitPaq :lua require'plugins'.init_paq()

" sessions
if(argc() == 0)
  autocmd vimRc VimLeave * :call functions#makesession(1)
else
  autocmd vimRc VimLeave * :call functions#makesession(0)
endif
command! -nargs=0 SS :call functions#loadsession()

set termguicolors
colorscheme hydrangea

set secure
