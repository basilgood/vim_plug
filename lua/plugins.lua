local M = {}

function M.init_paq()
  vim.cmd 'packadd paq-nvim'
  local paq = require'paq-nvim'.paq
  paq {'junegunn/fzf', hook = vim.fn['fzf#install']}
  paq 'junegunn/fzf.vim'
  paq 'tpope/vim-fugitive'
  paq 'ojroques/nvim-lspfuzzy'
  paq 'norcalli/nvim-colorizer.lua'
  paq 'neovim/nvim-lspconfig'
  paq 'nvim-lua/completion-nvim'
  paq 'tsuyoshicho/vim-efm-langserver-settings'
  paq 'nvim-lua/lsp_extensions.nvim'
  paq 'neomake/neomake'
  paq 'stefandtw/quickfix-reflector.vim'
  paq 'hauleth/asyncdo.vim'
  paq 'hoob3rt/lualine.nvim'
  paq 'sheerun/vim-polyglot'
  paq {'romgrk/winteract.vim', opt = true}
  paq {'savq/paq-nvim', opt = true}
  paq {'tomtom/tcomment_vim', opt = true}
  paq {'tpope/vim-surround', opt = true}
  paq {'tpope/vim-repeat', opt = true}
  paq {'airblade/vim-gitgutter', opt = true}
  paq {'gotchane/vim-git-commit-prefix', opt = true}
  paq {'rhysd/conflict-marker.vim', opt = true}
  paq {'editorconfig/editorconfig-vim', opt = true}
  paq {'haya14busa/vim-asterisk', opt = true}
  paq {'hotwatermorning/auto-git-diff', opt = true}
  paq {'whiteinge/diffconflicts', opt = true}
  paq {'basilgood/smarttab.vim', opt = true}
  paq {'mbbill/undotree', opt = true}
  paq {'wellle/targets.vim', opt = true}
  paq {'basilgood/hydrangea-vim', opt = true}
end

return M
