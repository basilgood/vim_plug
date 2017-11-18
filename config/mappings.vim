scriptencoding utf-8

" For Undo Revision, Break Undo Sequence
inoremap <CR> <C-g>u<CR>
inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>

" reload vim and file
nmap <leader><leader> :source $MYVIMRC<cr>
nmap ,, :e<CR>

" physical moving
noremap j gj
noremap k gk
nmap 0 ^
nmap 9 $

" indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" quick save, quit and undo
nnoremap <silent> <c-s> :<C-u>update<CR>
nnoremap <silent> <c-q> :<C-u>bd<CR>
inoremap <silent> <c-s> <Esc>:<C-u>update<CR>
imap <silent> <c-z> <c-o>u

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd
command! Q q
command! Qa qa

" widows
nnoremap [Window] <Nop>
nmap z [Window]
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>:wincmd w<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""

" visual select
nmap vv viw
vmap <Space> <esc>
nmap vl ^vg_

" don't use commands.
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap <C-z> <Nop>
noremap <F1> <Nop>

" repeat last command for each line of a visual selection
vnoremap . :normal .<CR>

" numbers
noremap ,n :set invnumber<CR>

" nerdtree
nmap - :NERDTreeToggle<CR>
nmap <leader>- :NERDTreeFind<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMouseMode = 3

" ansible
let g:ansible_unindent_after_newline = 1

" completion
let g:neocomplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" statusline
let g:statline_fugitive = 1
let g:statline_filename_relative = 1

" buffers
nmap <BS> :b *<C-Z>
nmap ,l :<C-u>ls<CR>:<C-u>b

" asyncrun
nmap <F9> :call asyncrun#quickfix_toggle(8)<cr>
nmap <F2> :AsyncRun! grep -R<Space>
nmap <F3> :AsyncRun! grep -R <cword><CR>
nmap <F4> :AsyncStop<CR>
nmap <F5> :AsyncRun! git status<CR>
nmap <F6> :AsyncRun! git add .
nmap <F7> :AsyncRun! git commit -m ''<Left>
nmap <F8> :AsyncRun! git push

" pairs
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
