vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local wk = require('which-key')

wk.register({
    e = {'<cmd>NvimTreeToggle<cr>', 'explorer'},
    f = {
        name = 'File',
            f = {'<cmd>Telescope find_files theme=dropdown<cr>', 'Find files'},
            g = {'<cmd>Telescope live_grep theme=dropdown<cr>', 'Live grep'},
            b = {'<cmd>Telescope buffers theme=dropdown<cr>', 'Buffers'},
            h = {'<cmd>Telescope help_tags theme=dropdown<cr>', 'Help'},
    },
    g = {
        s = { '<cmd>Git<cr>', 'Fugitive'}
    },
    h = {
        name = 'Hop',
        w = {require'hop'.hint_words, 'words'},
        l = {require'hop'.hint_lines, 'lines'},
        s = {require'hop'.hint_patterns, 'patterns'},
    },
    K = {vim.lsp.buf.hover, 'LSP Hover'},
    l = {
        h = {vim.lsp.buf.signature_help, 'Signature help'},
        R = {vim.lsp.buf.rename, 'Rename'},
        d = {'<cmd>Telescope lsp_definitions theme=dropdown<cr>', 'Definitions'},
        D = {'<cmd>Telescope lsp_type_definitions theme=dropdown<cr>', 'Type definitions'},
        r = {'<cmd>Telescope lsp_references theme=dropdown<cr>', 'References'},
        i = {'<cmd>Telescope lsp_implementations theme=dropdown<cr>', 'Implementations'},
        c = {
            a = {vim.lsp.buf.code_action, 'Code actions'},
        },
        w = {
            d = {'<cmd>Telescope diagnostics theme=dropdown<cr>', 'Workspace diagnostics'},
        }
    },
}, { prefix = '<leader>'})

wk.register({
    l = { c = { a = {vim.lsp.buf.code_action, 'Code actions'}}},
}, { prefix = '<leader>', mode = 'v'})

wk.register({
    w = {require'hop'.hint_words, 'words'},
    l = {require'hop'.hint_lines, 'lines'},
    s = {require'hop'.hint_patterns, 'patterns'},
}, { prefix = 'h', mode = 'v'})

wk.register({
    ['<c-l>'] = {'<cmd>noh<cr>', 'No highlight'},
})
