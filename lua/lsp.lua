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
  vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",      { noremap = true, silent = true, })
  vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>",            { noremap = true, silent = true, })
  vim.api.nvim_set_keymap("n", "<c-x>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true, })
end

lspconfig.tsserver.setup{
  on_attach=on_attach,
}
lspconfig.vimls.setup{
  on_attach=on_attach,
}
