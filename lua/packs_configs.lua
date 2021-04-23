vim.cmd('packadd vimpeccable')
local vimp = require 'vimp'
local com = vim.api.nvim_command
local cmd = vim.cmd

-- netrw
vim.cmd('packadd! vim-vinegar')
cmd 'autocmd FileType netrw nmap <buffer><silent> <right> <cr>'
cmd 'autocmd FileType netrw nmap <buffer><silent> <left> -'
cmd 'autocmd FileType netrw nmap <buffer> <TAB> mf'
cmd 'autocmd FileType netrw nmap <buffer> <S-TAB> mF'
cmd 'autocmd FileType netrw nmap <buffer> <c-x> mfmx'

-- oneterm
vim.g.oneterm_yank = true
vim.g.oneterm_ignore = {'.git/', 'node_modules/'}
vim.g.oneterm_options = {border = 'single'}
vimp.nnoremap('<c-p>', ':OneTerm<CR>')
vimp.nnoremap('<bs>', ':OneTerm buffers<CR>')
vimp.nnoremap('<leader>o', ':OneTerm oldfiles<CR>')
vimp.nnoremap('<leader>g', ':OneTerm rg<CR>')
vimp.nnoremap('<leader>r', ':OneTerm references<CR>')
vimp.nnoremap('<leader>s', ':OneTerm symbols<CR>')
vimp.nnoremap('<leader>w', ':OneTerm ws_symbols<CR>')
vimp.nnoremap('<leader>h', ':OneTerm history<CR>')

-- lsp
vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd! nvim-ale-diagnostic')
local lspconfig = require('lspconfig')
local on_attach = function()
  vim.cmd('packadd! lsp_signature.nvim')
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
  vimp.nnoremap({'buffer', 'silent'}, 'gd',
                '<Cmd>lua vim.lsp.buf.definition()<CR>')
  vimp.nnoremap({'buffer', 'silent'}, 'gr',
                '<cmd>lua vim.lsp.buf.references()<CR>')
  vimp.nnoremap({'buffer', 'silent'}, 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  vimp.nnoremap({'buffer', 'silent'}, 'ca',
                '<cmd>lua vim.lsp.buf.code_action()<CR>')
end
lspconfig.tsserver.setup {on_attach = on_attach}

-- compe
vim.cmd 'packadd! nvim-compe'
require'compe'.setup {
  enabled = true,
  debug = false,
  min_length = 2,
  preselect = 'disable',
  allow_prefix_unmatch = false,
  throttle_time = 120,
  source_timeout = 200,
  incomplete_delay = 400,
  source = {path = true, buffer = true, nvim_lsp = true}
}
vimp.inoremap({'silent', 'expr'}, '<CR>', 'compe#confirm(\'<CR>\')')
vimp.inoremap({'expr'}, '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- ale
vim.cmd('packadd! ale')
vim.g.ale_disable_lsp = 1
vim.g.ale_sign_error = '✖'
vim.g.ale_sign_warning = '!'
vim.g.ale_set_highlights = 0
vim.g.ale_lint_on_text_changed = 'normal'
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_delay = 0
vim.g.ale_echo_msg_format = '%s'
vim.g.ale_linters = {
  jsx = {'eslint'},
  javascript = {'eslint'},
  typescript = {'eslint'}
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

-- gitgutter
vim.cmd('packadd! vim-gitgutter')
vim.g.gitgutter_sign_priority = 8
vim.g.gitgutter_override_sign_column_highlight = 0
vimp.nmap('ghs', '<Plug>(GitGutterStageHunk)')
vimp.nmap('ghu', '<Plug>(GitGutterUndoHunk)')
vimp.nmap('ghp', '<Plug>(GitGutterPreviewHunk)')

-- asterisk
vim.cmd('packadd! vim-asterisk')
vimp.nmap('*', '<Plug>(asterisk-z*)')
vimp.vmap('*', '<Plug>(asterisk-z*)')

-- nvim-cursor-hold
vim.cmd('packadd! FixCursorHold.nvim')
vim.g.cursorhold_updatetime = 100

-- toggle term
vim.cmd('packadd! FTerm.nvim')
require'FTerm'.setup()
local term = require('FTerm.terminal')
local tig = term:new()
tig:setup({cmd = 'tig --all'})
function _G.__fterm_tig() tig:toggle() end
com([[command! Tig lua __fterm_tig()]])
vimp.tnoremap('<c-q>', [[<C-\><C-n>]])
vimp.nmap([[<C-\>]], ':FTermToggle<cr>')
vimp.tnoremap([[<C-\>]], '<C-\\><C-n>:FTermToggle<cr>')

-- formatter
vim.cmd('packadd! format.nvim')
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

-- notes
vim.g.NotesDir = '~/.notes'
vim.g.HtmlDir = '~/.notes/html-notes'
vim.g.NoteSuffix = '.md'
vim.cmd('packadd! vimNotes')
vim.cmd('command! NN call NewNoteWithPath()')
vim.cmd('command! NF call FindNote()')
vim.cmd('command! NS call FindInNote()')

-- template html
vim.g.vim_jsx_pretty_template_tags = {'html', 'css', 'style = '}

-- treesitter
vim.cmd 'packadd! nvim-treesitter'
local ts_config = require('nvim-treesitter.configs')
ts_config.setup {
  ensure_installed = {
    'javascript', 'typescript', 'jsdoc', 'json', 'html', 'css', 'bash', 'lua'
  },
  highlight = {enable = true, use_languagetree = true}
}

-- undotree
vim.cmd('packadd! undotree')
vim.g.undotree_WindowLayout = 4
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1

-- colorizer
vim.o.termguicolors = true
vim.cmd('packadd! nvim-colorizer.lua | lua require"colorizer".setup()')

-- git
com('autocmd CmdlineEnter * packadd vim-fugitive')
com('autocmd CmdlineEnter * packadd gv.vim')

-- packs
vim.cmd('packadd! oneterm')
vim.cmd('packadd! nvim-bqf')
vim.cmd('packadd! tcomment_vim')
vim.cmd('packadd! vim-surround')
vim.cmd('packadd! vim-repeat')
vim.cmd('packadd! editorconfig-vim')
vim.cmd('packadd! vim-git-commit-prefix')
vim.cmd('packadd! auto-git-diff')
vim.cmd('packadd! diffconflicts')
vim.cmd('packadd! targets.vim')
vim.cmd('packadd! vim-indent-object')
vim.cmd('packadd! winteract.vim')
vim.cmd('packadd! vim-cool')
vim.cmd('packadd! cmdline-completion')
vim.cmd('packadd! vim-system-copy')
vim.cmd('packadd! vim-niceblock')
vim.cmd('packadd! vim-expandtab')
vim.cmd('packadd! tabline')
