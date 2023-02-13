local servers = {
  clangd = {
    init_options = { clangdFileStatus = true },
  },
  pyright = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false, },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}

require('neodev').setup()

require('mason').setup{
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

local handlers = require('lsp.handlers')
handlers.setup()

mason_lspconfig.setup_handlers{
  function (server_name)
    require('lspconfig')[server_name].setup{
      capabilities = handlers.capabilities,
      on_attach = handlers.on_attach,
      settings = servers[server_name],
    }
  end
}
