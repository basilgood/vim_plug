-- neovim config

require 'packs'

require 'options'

require 'mappings'

require 'autocmds'

require 'commands'

vim.cmd('colorscheme hydrangea')
vim.cmd [[highlight! Normal guibg=NONE]]

vim.o.exrc = true
vim.o.secure = true
