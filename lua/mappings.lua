local vimp = require 'vimp'

-- misc
vimp.nnoremap('j', 'gj')
vimp.nnoremap('k', 'gk')
vimp.nnoremap('<Down>', 'gj')
vimp.nnoremap('<Up>', 'gk')
vimp.cnoremap('<C-a>', '<Home>')
vimp.cnoremap('<C-e>', '<End>')
vimp.inoremap('<C-a>', '<Home>')
vimp.inoremap('<C-e>', '<End>')
vimp.nnoremap('}', '}zz')
vimp.nnoremap('{', '{zz')
vimp.nnoremap('<space>gf', [[:vertical wincmd f<cr>]])
vimp.nnoremap('<C-g>',
              [[:echon '['.expand("%:p:~").'] '.'[L:'.line('$').']']] ..
                  [[<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<cr>]])

-- objects: line, entire
vimp.vnoremap({'expr'}, 'il', [[<Esc>^vg_]], {silent = true})
vimp.onoremap({'silent'}, 'il', [[:<C-U>normal! ^vg_<cr>]])
vimp.vnoremap({'silent'}, 'ie', 'gg0oG$')
vimp.onoremap({'silent'}, 'ie',
              [[:<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>]])

-- keep paste in visual
vimp.vnoremap('P', '"0p')

-- substitute
vimp.nnoremap('ss', [[:%s/]])
vimp.nnoremap('sl', [[:s/]])
vimp.vnoremap('ss', [[:s/]])

-- search and replace
vimp.nnoremap('sn', '*Ncgn')

-- diff two buffers
vimp.nnoremap({'silent', 'expr'}, '<space>dt',
              [[":<C-u>"."windo ".(&diff?"diffoff":"diffthis")."<CR>"]])

-- execute macro
vimp.nnoremap('Q', '@q')
vimp.vnoremap('Q', [[:norm Q<cr>]])

-- jump to window no
vim.api.nvim_exec([[
  for i in range(1, 9)
    execute 'nnoremap <silent> <space>'.i.' :'.i.'wincmd w<CR>'
  endfor
  execute 'nnoremap <silent> <space>0 :wincmd p<CR>'
]], false)

-- jumping
vimp.nnoremap({'silent'}, ']q',
              [[:call functions#listjump("c", "next", "first")<CR>]])
vimp.nnoremap({'silent'}, '[q',
              [[:call functions#listjump("c", "previous", "last")<CR>]])
vimp.nnoremap({'silent'}, ']w',
              [[:call functions#listjump("l", "next", "first")<CR>]])
vimp.nnoremap({'silent'}, '[w',
              [[:call functions#listjump("l", "previous", "last")<CR>]])

-- allows incsearch highlighting for range commands
vimp.cnoremap('<c-x>t', [[<CR>:t''<CR>]])
vimp.cnoremap('<c-x>m', [[<CR>:m''<CR>]])
vimp.cnoremap('<c-x>d', [[<CR>:d<CR>``]])
