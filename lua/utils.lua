_G.execute = vim.api.nvim_command
_G.api = vim.api
_G.com = vim.api.nvim_command
_G.cmd = vim.cmd
_G.fn = vim.fn
_G.g = vim.g

_G.scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function _G.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

function _G.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
