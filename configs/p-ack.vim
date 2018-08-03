scriptencoding utf-8

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_mappings = { 'o': '<CR>zz' }
nnoremap ,f :<C-u>Ack!<CR>
nnoremap ,g :<C-u>Ack!<Space>
nnoremap ,j :<C-u>Ack!<Space><C-r><C-w><Space>
