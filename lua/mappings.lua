-- mappings

local map = require "utils/general".map

-- complete
map("i", "<Tab>", [[pumvisible() ? '<C-n>' : '<Tab>']], {silent = true, expr = true})
map("i", "<S-Tab>", [[pumvisible() ? '<C-p>' : '<S-Tab>']], {silent = true, expr = true})
map('i', '<CR>',    [[pumvisible() ? '<C-Y>' : '<CR>']], {silent = true, expr = true})

-- netrw
map('n', '-', [[bufname() == '' ? ':edit .<cr>':':edit %:h<cr>']], {silent = true, expr = true})

-- misc
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<Down>', 'gj')
map('n', '<Up>', 'gk')
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')
map('i', '<C-a>', '<Home>')
map('i', '<C-e>', '<End>')
map('n', '}', '}zz')
map('n', '{', '{zz')
map('n', '<space>gf', [[:vertical wincmd f<cr>]])
map('n', '<C-g>', [[:echon '['.expand("%:p:~").'] '.'[L:'.line('$').']']] ..
  [[<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<cr>]])

-- objects: block. line, entire
map('x', 'I', [[(mode()=~#'[vV]'?'<C-v>^o^I':'I')]], {expr = true})
map('x', 'A', [[(mode()=~#'[vV]'?'<C-v>0o$A':'A')]], {expr = true})
map('x', 'il', [[<Esc>^vg_]], {silent = true})
map('o', 'il', [[:<C-U>normal! ^vg_<cr>]], {silent = true})
map('x', 'ie', 'gg0oG$', {silent = true})
map('o', 'ie', [[:<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>]], {silent = true})

-- paste from change
map('v', 'P', '"0p')

-- substitute
map('n', 'ss', [[:%s/]])
map('n', 'sl', [[:s/]])
map('x', 's',  [[:s/]])

-- search and replace
map('n', 'sn', '*Ncgn')

-- diff two buffers
map('n', '<space>dt', [[":<C-u>"."windo ".(&diff?"diffoff":"diffthis")."<CR>"]], {silent = true, expr = true})

-- execute macro
map('n', 'Q', '<Nop>')
map('n', 'Q', '@q')
map('v', 'Q', [[:norm Q<cr>]])

-- jump to window no
vim.api.nvim_exec([[
  for i in range(1, 9)
    execute 'nnoremap <space>'.i.' :'.i.'wincmd w<CR>'
  endfor
  execute 'nnoremap <space>0 :wincmd p<CR>'
]], false)

-- jumping
map('n', ']q', [[:call functions#listjump("c", "next", "first")<CR>]], {silent = true})
map('n', '[q', [[:call functions#listjump("c", "previous", "last")<CR>]], {silent = true})
map('n', ']w', [[:call functions#listjump("l", "next", "first")<CR>]], {silent = true})
map('n', '[w', [[:call functions#listjump("l", "previous", "last")<CR>]], {silent = true})

-- allows incsearch highlighting for range commands
map('c', '<c-x>t', [[<CR>:t''<CR>]])
map('c', '<c-x>m', [[<CR>:m''<CR>]])
map('c', '<c-x>d', [[<CR>:d<CR>``]])

-- terminal
map('t', '<Esc>', [[<C-\><C-n>]])
