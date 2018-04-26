let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = ''
let g:ctrlp_switch_buffer = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multi = '1v'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
nnoremap <C-p> :packadd ctrlp.vim<CR>:CtrlP<CR>
nnoremap <Bs> :packadd ctrlp.vim<CR>:CtrlPBuffer<CR>
nnoremap <C-_> :packadd ctrlp.vim<CR>:CtrlPMRUFiles<CR>
nnoremap <C-d> :packadd ctrlp.vim<CR>:CtrlPCurFile<CR>
