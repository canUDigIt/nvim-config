vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', { desc = 'No Highlight' })

vim.keymap.set('n', '<leader>xG', '<cmd>source %<cr>')
vim.keymap.set({'n', 'v'}, '<leader>xl', ':.lua<cr>')

vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', function() require("flash").jump() end, { desc = 'Flash jump' })
vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', function() require("flash").treesitter() end, { desc = 'Flash treesitter' })

vim.keymap.set('n', '-', ':lua MiniFiles.open()<cr>', { desc = 'File Browser' } )
vim.keymap.set('n', '<leader>f', ':Pick files<cr>', { desc = 'Pick files' } )
vim.keymap.set('n', '<leader>b', ':Pick buffers<cr>', { desc = 'Pick files' } )
vim.keymap.set('n', '<leader>h', ':Pick help<cr>', { desc = 'Pick files' } )

function _G.set_terminal_keymaps()
  local map_opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], map_opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], map_opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], map_opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], map_opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], map_opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
