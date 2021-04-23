-- general
vim.o.shada = '!,\'300,<50,@100,s10,h';
vim.o.path = vim.o.path .. '**' .. 'tests'
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.autowrite = true
vim.o.autowriteall = true
-- vim.o.hidden = true
vim.o.termguicolors = true
vim.o.lazyredraw = true
vim.o.gdefault = true
vim.o.linebreak = true
vim.o.showbreak = string.rep(' ', 3)
vim.o.breakindent = true
vim.o.breakindentopt = 'sbr'
vim.o.mouse = 'a'
if vim.fn.executable('rg') then
  vim.g.grepprg = 'rg'
  vim.o.grepprg = vim.g.grepprg .. ' --vimgrep'
  vim.o.grepformat = '%f:%l:%c:%m'
end
vim.o.errorformat = vim.o.errorformat .. ',%f,'
vim.o.incsearch = true
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = 'aoOTIcF'
vim.o.showmode = false
vim.o.sidescrolloff = 5
vim.o.sidescroll = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.switchbuf = 'useopen,uselast'
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.cinoptions = '(0,u0,U0'
vim.o.confirm = true
vim.o.inccommand = 'nosplit'
vim.o.pumheight = 10
vim.o.updatetime = 50
vim.o.ttimeoutlen = 0
vim.o.timeoutlen = 2000
vim.o.iskeyword = 'a-z,A-Z,48-57,_,-'
vim.o.wildcharm = 9
vim.o.wildignorecase = true
vim.o.wildignore = '*/node_modules/*,*.git/*,*/bower_components/*'
vim.o.diffopt = vim.o.diffopt ..
                    ',vertical,context:3,algorithm:patience,indent-heuristic'
vim.wo.list = true
vim.o.listchars = 'tab:┊ ,trail:•,nbsp:␣,extends:↦,precedes:↤'
vim.wo.number = true
vim.wo.wrap = false
-- vim.o.tabline = '%!functions#tabline()'
vim.o.statusline = table.concat({
  ' %t ', '%m', '%#linenr#', '%=', '%{&filetype} ', '%#statuslinenc# ',
  '%2c:%l/%L '
})
