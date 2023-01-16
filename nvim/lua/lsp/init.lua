local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  print('Mason Lsp config plugin not available!')
  return
end
mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "clangd", "cmake", "cssls", "emmet_ls", "html", "jsonls", "pyright", "zls" }
})

status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  print('Lsp config plugin not available!')
  return
end

require 'lsp.lsp-installer'

local handlers = require('lsp.handlers')
handlers.setup()

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

lspconfig['clangd'].setup(vim.tbl_deep_extend('force', require('lsp.settings.clang'), opts))
lspconfig['cmake'].setup(opts)
lspconfig['cssls'].setup(opts)
lspconfig['emmet_ls'].setup(opts)
lspconfig['html'].setup(opts)
lspconfig['jsonls'].setup(opts)
lspconfig['pyright'].setup(opts)
lspconfig['sumneko_lua'].setup(vim.tbl_deep_extend('force', require('lsp.settings.sumneko_lua'), opts))
lspconfig['zls'].setup(opts)
