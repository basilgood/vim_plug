require'utils'

opt('o', 'path', '.,**')
opt('b', 'swapfile', false)
opt('o', 'writebackup', false)
opt('o', 'undofile', true)
opt('o', 'autowrite', true)
opt('o', 'autowriteall', true)
-- opt('o', 'hidden', true)
opt('w', 'number', true)
opt('o', 'termguicolors', true)
opt('o', 'lazyredraw', true)
opt('o', 'gdefault', true)
opt('w', 'wrap', false)
opt('o', 'linebreak', true)
opt('o', 'showbreak', 'string.rep(" ", 3)')
opt('w', 'breakindent', true)
opt('w', 'breakindentopt', 'sbr')
opt('o', 'mouse', 'a')
opt('o', 'grepprg', 'rg --vimgrep')
opt('o', 'grepformat', '%f:%l:%c:%m')
opt('o', 'incsearch', true)
opt('o', 'completeopt', 'menuone,noinsert,noselect')
opt('o', 'shortmess', 'aoOTIcF')
opt('o', 'showmode', false)
opt('o', 'sidescroll', 1)
opt('o', 'sidescrolloff', 5)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'switchbuf', 'useopen,uselast')
opt('b', 'expandtab', true)
opt('b', 'tabstop', 2)
opt('b', 'softtabstop', 2)
opt('b', 'shiftwidth', 2)
opt('b', 'smartindent', true)
opt('o', 'confirm', true)
opt('o', 'inccommand', 'nosplit')
opt('o', 'pumheight', 10)
opt('o', 'updatetime', 50)
opt('o', 'ttimeoutlen', 0)
opt('o', 'timeoutlen', 2000)
opt('o', 'wildcharm', 9)
opt('o', 'wildignorecase', true)
opt('o', 'wildignore', '*/.git,*/node_modules,')
opt('o', 'diffopt',
'internal,filler,closeoff,vertical,context:3,algorithm:patience,indent-heuristic')
opt('w', 'list', true)
opt('w', 'listchars', 'tab:┊ ,trail:•,nbsp:␣,extends:↦,precedes:↤')
opt('o', 'statusline', table.concat({
  ' %t ', '%m', '%=', '%{&filetype} ', '%2c:%l/%L '
}))
