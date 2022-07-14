vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local wk = require('which-key')

wk.register({
    e = {'<cmd>NvimTreeToggle<cr>', 'File Explorer'},
    f = {
        name = 'File',
            f = {'<cmd>Telescope find_files theme=dropdown<cr>', 'Find files'},
            g = {'<cmd>Telescope live_grep theme=dropdown<cr>', 'Live grep'},
            b = {'<cmd>Telescope buffers theme=dropdown<cr>', 'Buffers'},
            h = {'<cmd>Telescope help_tags theme=dropdown<cr>', 'Help'},
    },
    g = {
        name = 'Source Control',
        s = { '<cmd>Neogit<cr>', 'Neogit'}
    },
    h = {
        name = 'Hop',
        w = {require'hop'.hint_words, 'words'},
        l = {require'hop'.hint_lines, 'lines'},
        s = {require'hop'.hint_patterns, 'patterns'},
    },
}, { prefix = '<leader>'})

wk.register({
    w = {require'hop'.hint_words, 'words'},
    l = {require'hop'.hint_lines, 'lines'},
    s = {require'hop'.hint_patterns, 'patterns'},
}, { prefix = 'h', mode = 'v'})

wk.register({
    ['<c-l>'] = {'<cmd>noh<cr>', 'No highlight'},
})
