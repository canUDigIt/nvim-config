vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client, bufnr)
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
end

-- LSP setup
local lspconfig = require('lspconfig')

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Set default client capabilities plus window/workDoneProgress
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
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

local servers = {'clangd', 'cmake', 'pyright', 'sumneko_lua', 'volar', 'tsserver'}
for _, lsp in ipairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- (optional) Customize the options passed to the server
    if lsp == "clangd" then
        opts.init_options = { clangdFileStatus = true }
    end

    if lsp == "sumneko_lua" then
        local system_name
        if vim.fn.has("mac") == 1 then
            system_name = "macos"
        elseif vim.fn.has("unix") == 1 then
            system_name = "Linux"
        elseif vim.fn.has("win32") == 1 then
            system_name = "Windows"
        else
            print("Unsupported system for sumneko")
        end

        local sumneko_root_path = vim.fn.stdpath('data')..'/lsp_servers/sumneko_lua/lua-language-server'
        local sumneko_binary = sumneko_root_path..'/bin/'..system_name.."/lua-language-server"

        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        opts.cmd = {sumneko_binary, '-E', sumneko_root_path .."/main.lua"};
        opts.settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    lspconfig[lsp].setup(opts)
end

require'lspkind'.init()

