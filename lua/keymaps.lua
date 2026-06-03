vim.keymap.set('n', '<c-l>', function() vim.cmd.noh() end, { desc = 'No Highlight' })

vim.keymap.set('n', '<leader>xg', function() vim.cmd.source{ '%' } end, { desc = 'Source file' })
vim.keymap.set({'n', 'v'}, '<leader>xl', function() vim.cmd('.lua') end, { desc = 'Lua execute line' })

vim.keymap.set('n', '<leader>u', vim.pack.update, { desc = 'Update packages' })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>w', function() vim.cmd.write() end, { desc = 'Save file' })

vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', function() require("flash").jump() end, { desc = 'Flash jump' })
vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', function() require("flash").treesitter() end, { desc = 'Flash treesitter' })

vim.keymap.set('n', '<leader>t', function () MiniTrailspace.trim() end, { desc = 'Trim whitespace' })

if not vim.g.vscode then
  vim.keymap.set('n', '-', function() MiniFiles.open() end, { desc = 'File Browser' } )

  vim.keymap.set('n', '<leader>gg', vim.cmd.Neogit, { desc = 'Neogit' } )

  vim.keymap.set('n', '<leader>sf', function() MiniPick.builtin.files() end, { desc = 'Find files' } )
  vim.keymap.set('n', '<leader>sb', function() MiniPick.builtin.buffers() end, { desc = 'Find buffers' } )
  vim.keymap.set('n', '<leader>sh', function() MiniPick.builtin.help() end, { desc = 'Find help' } )
  vim.keymap.set('n', '<leader>sl', function() MiniExtra.pickers.buf_lines() end, { desc = 'Buffer Lines' } )
  vim.keymap.set('n', '<leader>so', function() MiniPick.builtin.grep() end, { desc = 'Grep Open Buffers' } )
  vim.keymap.set('n', '<leader>sg', function() MiniPick.builtin.grep_live() end, { desc = 'Grep' } )
  vim.keymap.set({'n', 'x'}, '<leader>sw', function() MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>')}) end, { desc = 'Visual selection or word' })
end
