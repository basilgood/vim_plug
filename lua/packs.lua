local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'
if vim.fn.isdirectory(install_path) == 0 then
  print(' clone paq-nvim...')
  vim.fn.execute('!git clone https://github.com/savq/paq-nvim.git ' ..
                     install_path)
end

vim.cmd 'packadd paq-nvim'
package.loaded['paq-nvim'] = nil
local Paq = require('paq-nvim')
local paq = Paq.paq

paq {'savq/paq-nvim', opt = true}
paq {'tpope/vim-vinegar', opt = true}
paq {'neovim/nvim-lspconfig', opt = true}
paq {'hrsh7th/nvim-compe', opt = true}
paq {'ray-x/lsp_signature.nvim', opt = true}
paq {'nvim-treesitter/nvim-treesitter', opt = true}
paq {'dense-analysis/ale', opt = true}
paq {'nathunsmitty/nvim-ale-diagnostic', opt = true}
paq {'junegunn/fzf', opt = true}
paq {'junegunn/fzf.vim', opt = true}
paq {'airblade/vim-gitgutter', opt = true}
paq {'tpope/vim-fugitive', opt = true}
paq {'junegunn/gv.vim', opt = true}
paq {'kevinhwang91/nvim-bqf', opt = true}
paq {'hauleth/asyncdo.vim', opt = true}
paq 'maxmellon/vim-jsx-pretty'
paq 'yuezk/vim-js'
paq 'LnL7/vim-nix'
paq {'editorconfig/editorconfig-vim', opt = true}
paq {'vim-scripts/cmdline-completion', opt = true}
paq {'terrortylor/nvim-comment', opt = true}
paq {'tpope/vim-surround', opt = true}
paq {'tpope/vim-repeat', opt = true}
paq {'gotchane/vim-git-commit-prefix', opt = true}
paq {'hotwatermorning/auto-git-diff', opt = true}
paq {'whiteinge/diffconflicts', opt = true}
paq {'haya14busa/vim-asterisk', opt = true}
paq {'mbbill/undotree', opt = true}
paq {'wellle/targets.vim', opt = true}
paq {'michaeljsmith/vim-indent-object', opt = true}
paq {'romgrk/winteract.vim', opt = true}
paq {'basilgood/vim-system-copy', opt = true}
paq {'romainl/vim-cool', opt = true}
paq {'antoinemadec/FixCursorHold.nvim', opt = true}
paq {'basilgood/smarttab.vim', opt = true}
paq {'numtostr/FTerm.nvim', opt = true}
paq {'lukas-reineke/format.nvim', opt = true}
paq {'norcalli/nvim-colorizer.lua', opt = true}
paq {'basilgood/barow', opt = true}
paq {'basilgood/tokyodark.nvim', opt = true}

Paq.install()
Paq.update()
Paq.clean()
