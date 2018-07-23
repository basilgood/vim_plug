scriptencoding utf-8

nnoremap <Space>n :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
nnoremap <silent> [- :vertical resize +1<CR>
nnoremap <silent> ]= :vertical resize -1<CR>
vnoremap . :normal .<CR>
nnoremap ,w :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <Space>s :%s//<left>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <space><space> :tabnew %<CR>
nnoremap <space>q :tabclose<CR>
nnoremap <Space>w viw"+p
nnoremap <Space>p :put+<CR>
nnoremap <Space>P :put!+<CR>
vnoremap <Space>y "+y
vnoremap <Space>p "+p
vnoremap <Space>P "+P
inoremap <C-v> <C-R>+
