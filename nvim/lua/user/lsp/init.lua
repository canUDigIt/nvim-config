local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  print('Lsp config plugin not available!')
  return
end

require 'user.lsp.lsp-installer'
require('user.lsp.handlers').setup()
