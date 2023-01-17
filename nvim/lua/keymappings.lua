local function set_breakpoint_on_condition ()
  require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

local function set_breakpoint_message ()
  require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end

vim.keymap.set('n', '<leader>dc', require'dap'.continue, {desc = 'continue'})
vim.keymap.set('n', '<leader>dn', require'dap'.step_over, {desc = 'step over'})
vim.keymap.set('n', '<leader>di', require'dap'.step_into, {desc = 'step into'})
vim.keymap.set('n', '<leader>df', require'dap'.step_out, {desc = 'step out'})
vim.keymap.set('n', '<leader>db', require'dap'.toggle_breakpoint, {desc = 'toggle breakpoint'})
vim.keymap.set('n', '<leader>dB', set_breakpoint_on_condition, {desc = 'breakpoint condition'})
vim.keymap.set('n', '<leader>dlp', set_breakpoint_message, {desc = 'breakpoint message'})
vim.keymap.set('n', '<leader>dr', require'dap'.repl.open, {desc = 'reple open'})
vim.keymap.set('n', '<leader>dR', require'dap'.run_last, {desc = 'run last'})

vim.keymap.set('n', '<leader>e', '<cmd>RnvimrToggle<cr>', {desc =  'file explorer'})

vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files theme=dropdown<cr>', {desc = 'search files'})
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep theme=dropdown<cr>', {desc = 'live grep'})
vim.keymap.set('n', '<leader>sb', '<cmd>Telescope buffers theme=dropdown<cr>', {desc = 'search buffers'})
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags theme=dropdown<cr>', {desc = 'search help'})
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope colorscheme theme=dropdown<cr>', {desc = 'search colorscheme'})

vim.keymap.set('n', '<leader>gs',  '<cmd>Git<cr>', {desc = 'git status'})

vim.keymap.set('n', '<leader>hw', require'hop'.hint_words, {desc = 'hop words'})
vim.keymap.set('n', '<leader>hl', require'hop'.hint_lines, {desc = 'hop lines'})
vim.keymap.set('n', '<leader>hs', require'hop'.hint_patterns, {desc = 'hop patterns'})

vim.keymap.set('v', 'hw', require'hop'.hint_words, {desc = 'hop words'})
vim.keymap.set('v', 'hl', require'hop'.hint_lines, {desc = 'hop lines'})
vim.keymap.set('v', 'hs', require'hop'.hint_patterns, {desc = 'hop patterns'})

-- vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', {desc = 'no highlight'})
