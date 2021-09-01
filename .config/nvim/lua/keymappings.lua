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
            {'h', [[<Cmd>lua require('lspsaga.provider').lsp_finder()<CR>]]},
            {'r', [[<Cmd>lua require('lspsaga.rename').rename()<CR>]]},
            {'d', [[<Cmd>lua require('lspsaga.provider').preview_definition()<CR>]]},
            {'s', '<cmd>Neogit<CR>'},
        }},
        {'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]]},
        {'l', {
            {'a', [[<cmd>lua require('lspsaga.codeaction').code_action()<cr>]]},
            {'d', [[<Cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>]]},
            {'c', [[<Cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>]]}
        }},
        {'S', [[<cmd>lua require('spectre').open()<cr>]]},
        {'s', {
            {'w', [[<cmd>lua require('spectre').open_visual()<cr>]]},
            {'p', [[<cmd>lua require('spectre').open_file_search()<cr>]]}
        }}
    }},

    {mode = 'i', {
        {'<Tab>', 'v:lua.tab_complete()'},
        {'<S-Tab>', 'v:lua.s_tab_complete()'},
        {'<C-Space>', 'compe#complete()'},
        {'<CR>', [[compe#confirm('<CR>')]]},
        {'<C-e>', [[compe#close('<C-e>')]]},
        {'<C-f>', [[compe#scroll({ 'delta': +4 })]]},
        {'<C-d>', [[compe#scroll({ 'delta': -4 })]]},
    }},

    {mode = 's', {
        {'<Tab>', 'v:lua.tab_complete()'},
        {'<S-Tab>', 'v:lua.s_tab_complete()'},
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
