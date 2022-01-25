local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
	return
end

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

lsp_installer.on_server_ready(function (server)
    local opts = {
        on_attach = require('user.lsp.handlers').on_attach,
        capabilities = require('user.lsp.handlers').capabilities,
    }

    if server.name == "clangd" then
      local clang_opts = require('user.lsp.settings.clang')
      opts = vim.tbl_deep_extend('force', clang_opts, opts)
    end

    if server.name == "sumneko_lua" then
      local sumneko_opts = require('user.lsp.settings.sumneko_lua')
      opts = vim.tbl_deep_extend('force', sumneko_opts, opts)

    end

    server:setup(opts)
end)