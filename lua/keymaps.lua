vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', { desc = 'No Highlight' })

vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<cr>')
vim.keymap.set('n', '<leader>x', ':.lua<cr>')
vim.keymap.set('v', '<leader>x', ':lua<cr>')
