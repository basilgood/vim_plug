-- init
require'utils'
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

-- sessions
if fn.empty(fn.glob('~/.cache/sessions')) > 0 then
  os.execute 'mkdir -p ~/.cache/sessions'
end
cmd 'autocmd! VimLeavePre * execute "mksession! ~/.cache/sessions/" . split(getcwd(), "/")[-1] . ".vim"'
com([[command! -nargs=0 SS :execute 'source ~/.cache/sessions/' .  split(getcwd(), '/')[-1] . '.vim']])

cmd 'packadd! tokyodark.nvim'
cmd 'colorscheme tokyodark'

vim.o.exrc = true
vim.o.secure = true
