local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  print('Lsp config plugin not available!')
  return
end

require 'user.lsp.lsp-installer'

local handlers = require('user.lsp.handlers')
handlers.setup()

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

lspconfig['clangd'].setup(vim.tbl_deep_extend('force', require('user.lsp.settings.clang'), opts))
lspconfig['cmake'].setup(opts)
lspconfig['cssls'].setup(opts)
lspconfig['emmet_ls'].setup(opts)
lspconfig['html'].setup(opts)
lspconfig['pyright'].setup(opts)
lspconfig['sumneko_lua'].setup(vim.tbl_deep_extend('force', require('user.lsp.settings.sumneko_lua'), opts))
lspconfig['zls'].setup(opts)
