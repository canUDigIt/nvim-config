--Enable snippet support for css
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('cssls', {
  capabilities = capabilities,
})

vim.lsp.enable('basedpyright')
vim.lsp.enable('clangd')
vim.lsp.enable('cssls')
vim.lsp.enable('emmet_ls')
vim.lsp.enable('html')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ols')
vim.lsp.enable('ts_ls')
vim.lsp.enable('zls')
