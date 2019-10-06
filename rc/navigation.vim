scriptencoding utf-8

" vinegar
let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
autocmd vimRc FileType netrw call functions#innetrw()

" fzf
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>
call fz_f#fzf()
