vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local wk = require('which-key')

local function set_breakpoint_on_condition ()
  require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

local function set_breakpoint_message ()
  require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end

wk.register({
    d = {
        name = "+debug",
        c = {require'dap'.continue, 'continue'},
        n = {require'dap'.step_over, 'step over'},
        i = {require'dap'.step_into, 'step into'},
        f = {require'dap'.step_out, 'step out'},
        b = {require'dap'.toggle_breakpoint, 'toggle breakpoint'},
        B = {set_breakpoint_on_condition, 'breakpoint condition'},
        ['lp'] = {set_breakpoint_message, 'breakpoint message'},
        R = {require'dap'.repl.open, 'repl open'},
        r = {require'dap'.run_last, 'run last'},
    },
    e = {'<cmd>RnvimrToggle<cr>', 'File Explorer'},
    f = {
        name = '+files',
            f = {'<cmd>Telescope find_files theme=dropdown<cr>', 'Find files'},
            g = {'<cmd>Telescope live_grep theme=dropdown<cr>', 'Live grep'},
            b = {'<cmd>Telescope buffers theme=dropdown<cr>', 'Buffers'},
            h = {'<cmd>Telescope help_tags theme=dropdown<cr>', 'Help'},
            c = {'<cmd>Telescope colorscheme theme=dropdown<cr>', 'Colors'},
    },
    g = {
        name = '+vcs',
        s = { '<cmd>Neogit<cr>', 'Neogit'}
    },
    h = {
        name = '+hop',
        w = {require'hop'.hint_words, 'words'},
        l = {require'hop'.hint_lines, 'lines'},
        s = {require'hop'.hint_patterns, 'patterns'},
    },
}, { prefix = '<leader>'})

wk.register({
    name = '+hop',
    w = {require'hop'.hint_words, 'words'},
    l = {require'hop'.hint_lines, 'lines'},
    s = {require'hop'.hint_patterns, 'patterns'},
}, { prefix = 'h', mode = 'v'})

wk.register({
    ['<c-l>'] = {'<cmd>noh<cr>', 'No highlight'},
})
