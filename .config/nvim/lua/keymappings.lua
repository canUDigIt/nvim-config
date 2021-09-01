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
            {'h', [[<cmd>lua require('lspsaga.provider').lsp_finder()<cr>]]},
            {'r', [[<cmd>lua require('lspsaga.rename').rename()<cr>]]},
            {'d', [[<cmd>lua require('lspsaga.provider').preview_definition()<cr>]]},
            {'s', '<cmd>Neogit<cr>'},
        }},
        {'K', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>]]},
        {'l', {
            {'a', [[<cmd>lua require('lspsaga.codeaction').code_action()<cr>]]},
            {'d', [[<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<cr>]]},
            {'c', [[<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<cr>]]}
        }},
        {'S', [[<cmd>lua require('spectre').open()<cr>]]},
        {'s', {
            {'w', [[<cmd>lua require('spectre').open_visual()<cr>]]},
            {'p', [[<cmd>lua require('spectre').open_file_search()<cr>]]}
        }}
    }},

    {mode = 'v', {
        {'<leader>', {
            {'s', [[<cmd>lua require('spectre').open_visual()<cr>]]},
            {'ca', [[<Cmd>lua require('lspsaga.codeaction').range_code_action()<CR>]]},
        }}
    }},

    {'gD',  '<cmd>Telescope lsp_definitions<cr>'},
    {'[d', [[<Cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>]]},
    {']d', [[<Cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>]]},

    {'<C-', {
        {'f>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]]},
        {'b>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]]},
        {'k>', [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]]},

        {'l>', '<cmd>noh<cr>'},
        {'n>', '<cmd>NvimTreeToggle<cr>'},
    }},
}
