local packer_path =
vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    packer_path
  }
  vim.cmd("packadd packer.nvim")
end
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- packer
  use { 'wbthomason/packer.nvim', opt = true,
    setup = function()
      vim.cmd('autocmd vimRc BufWritePost packs.lua luafile %:p')
      vim.cmd('autocmd vimRc BufWritePost packs.lua PackerCompile')
    end,
  }

  -- lint
  use {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_set_highlights = 0
      vim.g.ale_disable_lsp = 1
      vim.g.ale_lint_on_text_changed = 'normal'
      vim.g.ale_lint_on_insert_leave = 1
      vim.g.ale_lint_delay = 0
      vim.g.ale_echo_msg_format = '%s'
      vim.g.ale_linters = {
        jsx = {'eslint'},
        javascript = {'eslint'},
        typescript = {'eslint'},
      }
      vim.g.ale_fixers = {
        jsx = {'eslint'},
        javascript = {'eslint'},
        typescript = {'eslint'},
        nix = {'nixpkgs-fmt'}
      }
      vim.api.nvim_exec([[
        nmap <silent> [a <Plug>(ale_previous_wrap)
        nmap <silent> ]a <Plug>(ale_next_wrap)
      ]], false)
    end
  }
  use {
    'nathunsmitty/nvim-ale-diagnostic',
    after = 'ale',
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    event = 'BufRead *',
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = function()
        print("LSP started.");
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = false,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
          })
        vim.api.nvim_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap("n", "gd", [[:Lspsaga preview_definition<CR>]], { noremap = true, silent = true, })
        vim.api.nvim_set_keymap('n', '<c-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap('n', '<c-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", { noremap = true, silent = true, })
        vim.api.nvim_set_keymap("v", "ga", "<cmd>lua require('lspsaga.codeaction').range_code_action()<CR>", { noremap = true, silent = true, })
      end

      lspconfig.tsserver.setup{
        on_attach=on_attach,
      }
      lspconfig.vimls.setup{
        on_attach=on_attach,
      }
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    after ='nvim-lspconfig',
    config = function()
      vim.api.nvim_set_keymap('n', '<A-d>', [[:Lspsaga open_floaterm<cr>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', '<A-d>', [[<C-\><C-n>:Lspsaga close_floaterm<CR>]], { noremap = true, silent = true })
    end
  }

  -- completion
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require'compe'.setup {
        enabled = true,
        debug = false,
        min_length = 2,
        preselect = 'disable',
        allow_prefix_unmatch = false,
        throttle_time  = 120,
        source_timeout = 200,
        incomplete_delay = 400,
        source = {
          path = true,
          buffer = true,
          nvim_lsp = true
        }
      }
    end
  }

  -- filetype/syntax
  use { 'nvim-treesitter/nvim-treesitter',
    event = 'BufRead *',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
          ensure_installed      = 'all',
          highlight             = { enable = true },
          textobjects = {
            select = {
              enable = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
              },
            },
          }
        })
    end,
  }
  use { 'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }
  use {
    'sheerun/vim-polyglot',
    config = function()
      vim.g.polyglot_disabled = {'autoindent', 'sensible'}
    end
  }
  use {'stefandtw/quickfix-reflector.vim', ft = 'qf'}

  -- aesthetic
  use {'basilgood/hydrangea-vim', opt = true}
  use {'glepnir/zephyr-nvim'}

  -- navigation
  use {
    'nvim-telescope/telescope.nvim',
    opt = true,
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    },
    cmd = { 'Telescope' },
    keys = {
      '<c-p>',
      '<bs>',
      '<leader>g',
      '<leader>o'
    },
    config = function()
      vim.cmd('packadd! plenary.nvim')
      vim.cmd('packadd! popup.nvim')
      local telescope = require'telescope'
      telescope.setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden'
          },
          layout_strategy = 'vertical',
          sorting_strategy = "descending",
          results_height = 15,
        }
      }
      vim.api.nvim_set_keymap(
        'n',
        '<C-p>',
        '<cmd>lua require"telescope.builtin".' ..
        'find_files(require("telescope.themes").' ..
        'get_dropdown({}))<cr>',
        {noremap = true, silent = true}
        )
      vim.api.nvim_set_keymap(
        'n',
        '<bs>',
        '<cmd>lua require"telescope.builtin".' ..
        'buffers(require("telescope.themes").get_dropdown({show_all_buffers = true}))<cr>',
        {noremap = true, silent = true}
        )
      vim.api.nvim_set_keymap(
        'n',
        '<leader>r',
        '<cmd>lua require"telescope.builtin".live_grep(require("telescope.themes").get_dropdown({}))<cr>',
        {noremap = true, silent = true}
        )
      vim.api.nvim_set_keymap(
        'n',
        '<leader>o',
        '<cmd>lua require"telescope.builtin".oldfiles(require("telescope.themes").get_dropdown({}))<cr>',
        {noremap = true, silent = true}
        )
    end
  }

  -- utils
  use 'hauleth/asyncdo.vim'
  use {'vim-scripts/cmdline-completion', event = 'CmdlineEnter *'}
  use {'tomtom/tcomment_vim', event = 'BufReadPost *'}
  use {'tpope/vim-repeat', event = 'BufReadPost *'}
  use {'tpope/vim-surround', event = 'BufReadPost *'}
  use {'editorconfig/editorconfig-vim', event = 'BufReadPost *'}
  use {'wellle/targets.vim', event = 'BufReadPost *'}
  use {'basilgood/smarttab.vim', event = 'BufReadPost *'}
  use {'lambdalisue/edita.vim'}
  use {'akinsho/nvim-toggleterm.lua',
    keys = [[<c-\>]],
    cmd = {'TermToggle', 'TermExec'},
    config = function()
      require"toggleterm".setup{
        size = 20,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        direction = 'horizontal',
      }
    end
  }
  use {
    'antoinemadec/FixCursorHold.nvim',
    event = 'BufReadPost *',
    config = function()
      vim.g.cursorhold_updatetime = 100
    end
  }
  use {
    'haya14busa/vim-asterisk',
    keys = '*',
    config = function()
      vim.g["asterisk#keeppos"] = 1
      vim.api.nvim_exec([[
        map *  <Plug>(asterisk-z*)
        map #  <Plug>(asterisk-z#)
        map g* <Plug>(asterisk-gz*)
        map g# <Plug>(asterisk-gz#)
      ]], false)
    end
  }
  use {
    'romgrk/winteract.vim',
    keys = 'gw',
    config = function()
      vim.api.nvim_exec([[
        nnoremap gw :InteractiveWindow<CR>
      ]], false)
    end
  }
  use {
    'mbbill/undotree',
    cmd = {'UndotreeToggle'},
    setup = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_ShortIndicators = 1
    end,
  }
  use {'romainl/vim-cool', event = 'BufReadPost *'}
  use {'christoomey/vim-system-copy', keys = {'cp', 'cv', 'cV'}}

  -- git
  use {
    'tpope/vim-fugitive',
    config = function()
      vim.api.nvim_exec([[
        nnoremap <silent> <space>gs :<C-u>Gstatus<cr>
        nnoremap <silent> <space>gd :<C-u>Gvdiffsplit!<cr>gg]
      ]], false)
    end
  }
  use {
    'junegunn/gv.vim',
    after = 'vim-fugitive',
    config = function()
      vim.api.nvim_command ([[command! GA GV --all]])
      vim.api.nvim_exec([[
        autocmd vimRc FileType GV nmap a q:GV --all<cr>
        autocmd vimRc FileType GV nmap gr q:GV<cr>
        autocmd vimRc FileType GV nmap g. :G<space>
      ]], false)
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      vim.cmd('packadd! plenary.nvim')
      require('gitsigns').setup {
        signs = {
          add          = {hl = 'GitGutterAdd'   , text = '+'},
          change       = {hl = 'GitGutterChange', text = '~'},
          delete       = {hl = 'GitGutterDelete', text = '_'},
          topdelete    = {hl = 'GitGutterDelete', text = '‾'},
          changedelete = {hl = 'GitGutterChange', text = '~'},
        }
      }
    end
  }
  use {'tpope/vim-rhubarb', after = 'vim-fugitive'}
  use {'hotwatermorning/auto-git-diff', ft = 'gitrebase'}
  use {'whiteinge/diffconflicts', cmd = {'DiffConflicts'}}
  use {'gotchane/vim-git-commit-prefix', ft = 'gitcommit'}
  use {
    'basilgood/memolist.vim',
    cmd = {'MemoNew', 'MemoList', 'MemoGrep'},
    setup = function()
      -- vim.g.memolist_fzf = 1
      vim.g.memolist_path = '~/.notes'
    end
  }
end)
