local nest = require('nest')

nest.applyKeymaps {
    {'<leader>', {
        {'c', '"+y'},
        {'o', 'm`o<esc>`'},
        {'f', {
            {'f', '<cmd>Telescope find_files<cr>'},
            {'g', '<cmd>Telescope live_grep<cr>'},
            {'b', '<cmd>Telescope buffers<cr>'},
            {'h', '<cmd>Telescope help_tags<cr>'},
        }},
        {'g', {
            {'s', '<cmd>Git<cr>'},
        }},
        {'K', [[<cmd>lua vim.lsp.buf.hover()<cr>]]},
        {'l', {
            {'h', [[<cmd>lua vim.lsp.buf.signature_help()<cr>]]},
            {'R', [[<cmd>lua vim.lsp.buf.rename()<cr>]]},
            {'d', [[<cmd>Telescope lsp_definitions<cr>]]},
            {'D', [[<cmd>Telescope lsp_type_definitions<cr>]]},
            {'r', [[<cmd>Telescope lsp_references<cr>]]},
            {'i', [[<cmd>Telescope lsp_implementations<cr>]]},
            {'ca', [[<cmd>Telescope lsp_code_actions<cr>]]},
            {'bd', [[<cmd>Telescope lsp_document_diagnostics<cr>]]},
            {'wd', [[<cmd>Telescope lsp_workspace_diagnostics<cr>]]}
        }},
    }},

    {mode = 'v', {
        {'<leader>', {
            {'lca', [[<cmd>Telescope lsp_range_code_actions<cr>]]},
        }}
    }},

    {'<C-', {
        {'l>', '<cmd>noh<cr>'},
        {'n>', '<cmd>NvimTreeToggle<cr>'},
    }},
}
