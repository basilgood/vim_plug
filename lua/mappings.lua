require'utils'

-- easy swith windows
map('n', '<leader><leader>', '<c-w>w')
-- when wrap
map('', 'j', 'v:count == 0 ? "gj" : "j"', {silent = true, expr = true})
map('', 'k', 'v:count == 0 ? "gk" : "k"', {silent = true, expr = true})
-- redline
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')
map('i', '<C-a>', '<Home>')
map('i', '<C-e>', '<End>')
-- center
map('n', '}', '}zz')
map('n', '{', '{zz')
map('n', '<space>gf', [[:vertical wincmd f<cr>]])
map('n', '<C-g>', [[:echon '['.expand("%:p:~").'] '.'[L:'.line('$').']']] ..
        [[<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<cr>]])
-- objects
map('x', 'I', [[mode()=~#'[vV]'?'<C-v>^o^I':'I']], {expr = true})
map('x', 'A', [[mode()=~#'[vV]'?'<C-v>0o$A':'A']], {expr = true})
map('v', 'il', [[<Esc>^vg_]], {silent = true})
map('o', 'il', [[:<C-U>normal! ^vg_<cr>]])
map('v', 'ie', 'gg0oG$')
-- paste from change
map('v', 'P', '"0p')
-- substitute
map('n', 'ss', [[:%s/]])
map('n', 'sl', [[:s/]])
map('v', 'ss', [[:s/]])
-- search and replace
map('n', 'sn', '*Ncgn')
-- execute macro
map('n', 'Q', '@q')
map('v', 'Q', [[:norm Q<cr>]])
-- copy/move from cmdline
map('c', '<c-x>t', [[<CR>:t''<CR>]])
map('c', '<c-x>m', [[<CR>:m''<CR>]])
map('c', '<c-x>d', [[<CR>:d<CR>``]])
