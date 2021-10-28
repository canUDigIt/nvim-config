local on_attach = function(client, bufnr)

    -- require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
    buf_set_keymap('n', '<leader>lsl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
    end

    require('lsp-status').on_attach(client)
    require('lsp_signature').on_attach(client)
end

-- LSP setup
local lspconfig = require('lspconfig')

local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Set default client capabilities plus window/workDoneProgress
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)
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

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- (optional) Customize the options passed to the server
    if server.name == "clangd" then
        opts.handlers = lsp_status.extensions.clangd.setup()
        opts.init_options = { clangdFileStatus = true }
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

require('nlua.lsp.nvim').setup(lspconfig, {
    capabilities = capabilities;
    on_attach = on_attach;
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    };
})

require'lspkind'.init()
