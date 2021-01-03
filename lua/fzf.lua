local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap
-- vim.g.fzf_layout = { ['down'] = '30%' }
vim.g.fzf_preview_window = 'right:60%'
vim.env.FZF_DEFAULT_OPTS = '--reverse'
map('n', '<C-p>',  '<CMD>Files<CR>'        , opts)
map('n', '<bs>',  '<CMD>Buffers<CR>'      , opts)
