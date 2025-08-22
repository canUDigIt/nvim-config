if vim.g.vscode then
  vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', { desc = 'No Highlight' })

  vim.keymap.set('n', '<leader>xG', '<cmd>source %<cr>', { desc = 'Source file' })
  vim.keymap.set({'n', 'v'}, '<leader>xl', ':.lua<cr>', { desc = 'Lua execute line' })

  vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
  vim.keymap.set({'n', 'v'}, '<leader>w', ':w<cr>', { desc = 'Save file' })

  vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', function() require("flash").jump() end, { desc = 'Flash jump' })
  vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', function() require("flash").treesitter() end, { desc = 'Flash treesitter' })
else
  vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', { desc = 'No Highlight' })

  vim.keymap.set('n', '<leader>xG', '<cmd>source %<cr>', { desc = 'Source file' })
  vim.keymap.set({'n', 'v'}, '<leader>xl', ':.lua<cr>', { desc = 'Lua execute line' })

  vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
  vim.keymap.set({'n', 'v'}, '<leader>w', ':w<cr>', { desc = 'Save file' })

  vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', function() require("flash").jump() end, { desc = 'Flash jump' })
  vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', function() require("flash").treesitter() end, { desc = 'Flash treesitter' })

  vim.keymap.set('n', '-', ':lua MiniFiles.open()<cr>', { desc = 'File Browser' } )
  vim.keymap.set('n', '<leader>f', function () Snacks.picker.files() end, { desc = 'Find files' } )
  vim.keymap.set('n', '<leader>b', function () Snacks.picker.buffers() end, { desc = 'Find buffers' } )
  vim.keymap.set('n', '<leader>h', function () Snacks.picker.help() end, { desc = 'Find help' } )

  vim.keymap.set('n', '<leader>gs', ':Neogit<cr>', { desc = 'Neogit' } )
  vim.keymap.set('n', '<leader>gl', function () Snacks.lazygit() end, { desc = 'Lazygit' } )

  vim.keymap.set('n', '<leader>sb', function() Snacks.picker.lines() end, { desc = 'Buffer Lines' } )
  vim.keymap.set('n', '<leader>sB', function() Snacks.picker.grep_buffers() end, { desc = 'Grep Open Buffers' } )
  vim.keymap.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = 'Grep' } )
  vim.keymap.set({'n', 'x'}, '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection or word' })
end
