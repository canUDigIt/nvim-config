local servers = {
  clangd = {
    init_options = { clangdFileStatus = true },
  },
  pylsp = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false, },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local config = {
  virtual_text = false,
  signs = { active = signs },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  }
}

vim.diagnostic.config(config)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Open Diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Diagnostics in Location List' })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('keep', opts, { desc = '[LSP] Declaration' }))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('keep', opts, { desc = '[LSP] Definition' }))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('keep', opts, { desc = '[LSP] Hover' }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('keep', opts, { desc = '[LSP] Implementation' }))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
      vim.tbl_extend('keep', opts, { desc = '[LSP] Signature Help' }))
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
      vim.tbl_extend('keep', opts, { desc = '[LSP] Add Workspace Folder' }))
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
      vim.tbl_extend('keep', opts, { desc = '[LSP] Remove Workspace Folder' }))
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend('keep', opts, { desc = '[LSP] List Workspace Folders' }))
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
      vim.tbl_extend('keep', opts, { desc = '[LSP] Type Definition' }))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, vim.tbl_extend('keep', opts, { desc = '[LSP] Rename' }))
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
      vim.tbl_extend('keep', opts, { desc = '[LSP] Code Action' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('keep', opts, { desc = '[LSP] References' }))
    vim.keymap.set('n', '<space>=', function()
      vim.lsp.buf.format { async = true }
    end, vim.tbl_extend('keep', opts, { desc = '[LSP] Format' }))
  end,
})

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true;
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',
    config = true,
    opt = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
          }
        end
      }
    end,
    opt = {
      ensure_installed = vim.tbl_keys(servers),
    },
  },
  'onsails/lspkind-nvim',
  {
    'j-hui/fidget.nvim',
    config = true,
  },
  {
    'folke/neodev.nvim',
    config = true,
  },
}
