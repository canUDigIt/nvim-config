local M = {}

M.setup = function()
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

  local function keymap_set(mode, key, action, description)
    local opts = { silent = true, desc = description }
    vim.keymap.set(mode, key, action, opts)
  end

  keymap_set("n", "[d", vim.diagnostic.goto_prev, "goto prev diagnostic")
  keymap_set("n", "]d", vim.diagnostic.goto_next, "goto next diagnostic")
  keymap_set("n", "<space>od", vim.diagnostic.open_float, "open float diagnostic")
  keymap_set("n", "<space>q", vim.diagnostic.setloclist, "set loclist")
end

M.on_attach = function(client, bufnr)
  vim.b.omnifunc = vim.lsp.omnifunc

  -- Mappings.
  local function keymap_set(mode, key, action, description)
    local opts = { buffer = bufnr, silent = true, desc = description }
    vim.keymap.set(mode, key, action, opts)
  end

  keymap_set("n", "gD", vim.lsp.buf.declaration, "declaration")
  keymap_set("n", "gd", vim.lsp.buf.definition, "definition")
  keymap_set("n", "K", vim.lsp.buf.hover, "hover")
  keymap_set("n", "gi", vim.lsp.buf.implementation, "implementation")
  keymap_set("n", "<C-k>", vim.lsp.buf.signature_help, "signature_help")
  keymap_set("n", "gr", vim.lsp.buf.references, "references")
  keymap_set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, "add workspace folder")
  keymap_set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, "remove workspace folder")
  keymap_set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "list workspace folders")
  keymap_set('n', '<space>D', vim.lsp.buf.type_definition, "type definition")
  keymap_set('n', '<space>rn', vim.lsp.buf.rename, "rename")
  keymap_set('n', '<space>ca', vim.lsp.buf.code_action, "code action")
  if client.server_capabilities.document_formatting then
    keymap_set({'n', 'v'}, '=', vim.lsp.with(vim.lsp.buf.format, { async = true }), "format")
  end
end

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true;
capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = {
        "",
        "quickfix",
        "refactor",
        "refactor.extract",
        "refactor.inline",
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      };
    };
  };
}

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

M.capabilities = capabilities

return M
