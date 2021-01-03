vim.o.showmode = false
local lualine = require('lualine')
lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'filename' },
  lualine_x = { 'location' },
  lualine_y = { 'filetype' }
}

lualine.inactive_sections = {
  lualine_a = {  },
  lualine_b = { 'filename' },
  lualine_x = { 'filetype' },
  lualine_y = {  }
}
lualine.status()
