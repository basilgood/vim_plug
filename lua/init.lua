-- encodings
vim.o.fileencoding = 'utf-8'
vim.bo.fileencoding = 'utf-8'
vim.api.nvim_exec([[
  augroup vimRc
    autocmd!
  augroup end
]], false)

-- netrw
vim.g.netrw_altfile = 1
vim.g.netrw_altv = 1
vim.g.netrw_preview = 1
vim.g.netrw_alto = 0
vim.g.netrw_use_errorwindow = 0

vim.api.nvim_command([[command! Paq lua require('packs')]])
require 'packs_configs'
require 'options'
require 'mappings'
require 'autocmds'
require 'commands'

vim.cmd 'packadd nvim-base16.lua'
local base16 = require 'base16'
base16(base16.themes['onedark'], true)
vim.cmd 'hi Search gui=underline guifg=#282a36 guibg=#606580 guisp=#dda882'
vim.cmd 'hi IncSearch guifg=#282a36 guibg=#eb4d97 guisp=#eb4d97'
vim.cmd 'hi StatusLine guifg=#171717 guibg=#536991'
vim.cmd 'hi StatusLineNC guifg=#606580 guibg=#192224'
-- vim.cmd [[highlight! Normal guibg=NONE]]

vim.o.exrc = true
vim.o.secure = true
