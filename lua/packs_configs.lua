require'utils'

--- netrw
cmd('packadd! vim-vinegar')
cmd 'autocmd FileType netrw nmap <buffer><silent> <right> <cr>'
cmd 'autocmd FileType netrw nmap <buffer><silent> <left> -'
cmd 'autocmd FileType netrw nmap <buffer> <TAB> mf'
cmd 'autocmd FileType netrw nmap <buffer> <S-TAB> mF'
cmd 'autocmd FileType netrw nmap <buffer> <c-x> mfmx'

-- oneterm
cmd 'packadd! fzf.vim'
cmd 'packadd! fzf'
map('n', '<c-p>', ':Files<CR>')
map('n', '<bs>', ':Buffers<CR>')

-- lsp
cmd('packadd nvim-lspconfig')
cmd('packadd! nvim-ale-diagnostic')
local lspconfig = require('lspconfig')
local on_attach = function()
  cmd('packadd! lsp_signature.nvim')
  require'lsp_signature'.on_attach()
  print('LSP started.');
  require('nvim-ale-diagnostic')
  vim.lsp.handlers['textDocument/publishDiagnostics'] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = false,
        signs = true,
        update_in_insert = false
      })
      map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
      map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
      map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
      map('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
end
lspconfig.tsserver.setup {on_attach = on_attach}

-- compe
cmd'packadd nvim-compe'
com([[autocmd InsertCharPre * lua require'compe'.setup {
  enabled = true,
  debug = false,
  min_length = 2,
  preselect = "disable",
  allow_prefix_unmatch = false,
  throttle_time = 120,
  source_timeout = 200,
  incomplete_delay = 400,
  source = {path = true, buffer = true, nvim_lsp = true}
}]])
map('i', '<CR>', 'compe#confirm(\'<CR>\')', {expr = true})
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true})
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true})

-- ale
cmd('packadd! ale')
g.ale_disable_lsp = 1
g.ale_sign_error = '• '
g.ale_sign_warning = '• '
g.ale_set_highlights = 0
g.ale_lint_on_text_changed = 'normal'
g.ale_lint_on_insert_leave = 1
g.ale_lint_delay = 0
g.ale_echo_msg_format = '%s'
g.ale_linters = {
  jsx = {'eslint'},
  javascript = {'eslint'},
  typescript = {'eslint'}
}
g.ale_fixers = {
  jsx = {'eslint'},
  javascript = {'eslint'},
  typescript = {'eslint'},
  nix = {'nixpkgs-fmt'}
}
map('n', '[a', '<Plug>(ale_previous_wrap)', {noremap = false})
map('n', ']a', '<Plug>(ale_next_wrap)', {noremap = false})

-- gitgutter
cmd('packadd! vim-gitgutter')
g.gitgutter_sign_priority = 8
g.gitgutter_override_sign_column_highlight = 0
map('n', 'ghs', '<Plug>(GitGutterStageHunk)', {noremap = false})
map('n', 'ghu', '<Plug>(GitGutterUndoHunk)', {noremap = false})
map('n', 'ghp', '<Plug>(GitGutterPreviewHunk)', {noremap = false})

-- asterisk
cmd('packadd! vim-asterisk')
map('n', '*', '<Plug>(asterisk-z*)', {noremap = false})
map('v', '*', '<Plug>(asterisk-z*)', {noremap = false})

-- nvim-cursor-hold
cmd('packadd! FixCursorHold.nvim')
g.cursorhold_updatetime = 100

-- toggle term
cmd('packadd! FTerm.nvim')
require'FTerm'.setup()
local term = require('FTerm.terminal')
local tig = term:new()
tig:setup({cmd = 'tig --all'})
function _G.__fterm_tig() tig:toggle() end
com([[command! Tig lua __fterm_tig()]])
map('t', '<c-q>', [[<C-\><C-n>]])
map('n', [[<C-\>]], ':lua require"FTerm".toggle()<cr>')
map('t', [[<C-\>]], '<C-\\><C-n>:lua require"FTerm".toggle()<cr>')

-- formatter
cmd('packadd! format.nvim')
require'format'.setup {
  ['*'] = {{cmd = {'sed -i \'s/[ \t]*$//\''}}},
  lua = {
    {
      cmd = {
        'lua-format -i --tab-width=2 --indent-width=2 --double-quote-to-single-quote'
      }
    }
  },
  nix = {cmd = {'nixpkgs-fmt -w'}},
  javascript = {
    {
      cmd = {
        'prettier -w --single-quote --trailing-comma none --arrow-parens avoid',
        './node_modules/.bin/eslint --fix'
      }
    }
  },
  markdown = {
    {cmd = {'prettier -w'}}, {
      cmd = {'black'},
      start_pattern = '^```javascript$',
      end_pattern = '^```$',
      target = 'current'
    }
  }
}

-- template html
g.vim_jsx_pretty_template_tags = {'html', 'css', 'style = '}

-- treesitter
cmd 'packadd! nvim-treesitter'
local ts_config = require('nvim-treesitter.configs')
ts_config.setup {
  ensure_installed = {
    'javascript', 'typescript', 'jsdoc', 'json', 'html', 'css', 'bash', 'lua'
  },
  highlight = {enable = true, use_languagetree = true}
}

-- undotree
cmd('packadd! undotree')
g.undotree_WindowLayout = 4
g.undotree_SetFocusWhenToggle = 1
g.undotree_ShortIndicators = 1

-- colorizer
vim.o.termguicolors = true
cmd('packadd! nvim-colorizer.lua | lua require"colorizer".setup()')

-- git
com('autocmd CmdlineEnter * packadd vim-fugitive')
com('autocmd CmdlineEnter * packadd gv.vim')

-- cmdline-completion
cmd 'autocmd CmdlineEnter * packadd cmdline-completion'

-- commentary
cmd('packadd! nvim-comment')
require('nvim_comment').setup({comment_empty = false})

-- smarttab
com('autocmd InsertEnter * packadd smarttab.vim')

-- qf
com('autocmd FileType qf packadd nvim-bqf')

-- git commit
com('autocmd CmdlineEnter * packadd vim-git-commit-prefix')
com('autocmd FileType gitcommit setlocal spell tw=72 colorcolumn+=51')

-- git rebase
com('autocmd FileType gitrebase packadd auto-git-diff')

-- git conflicts
com('autocmd CmdlineEnter * packadd diffconflicts')

-- packs
cmd 'packadd! vim-surround'
cmd 'packadd! vim-repeat'
cmd 'packadd! editorconfig-vim'
cmd 'packadd! targets.vim'
cmd 'packadd! vim-indent-object'
cmd 'packadd! winteract.vim'
cmd 'packadd! vim-cool'
cmd 'packadd! vim-system-copy'
cmd 'packadd! asyncdo.vim'
cmd 'packadd! barow'
