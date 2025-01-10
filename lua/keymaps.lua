vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', { desc = 'No Highlight' })

vim.keymap.set('n', '<leader>xG', '<cmd>source %<cr>')
vim.keymap.set('n', '<leader>xl', ':.lua<cr>')
vim.keymap.set('v', '<leader>xl', ':lua<cr>')

function _G.set_terminal_keymaps()
  local map_opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], map_opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], map_opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], map_opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], map_opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], map_opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
