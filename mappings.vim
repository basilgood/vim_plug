scriptencoding utf-8

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
nnoremap <silent> <C-Up> : resize -1<CR>
nnoremap <silent> <C-Down> : resize +1<CR>
nnoremap <silent> <C-Left> :vertical resize +1<CR>
nnoremap <silent> <C-Right> :vertical resize -1<CR>
vnoremap . :normal .<CR>
nnoremap ,w :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <Leader>s :%s//<left>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space><space> :tabnew %<CR>
nnoremap <space>q :tabclose<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>:redraw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

function! s:VSetSearch()
  let l:temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
