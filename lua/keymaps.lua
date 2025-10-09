vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', { desc = 'No Highlight' })

vim.keymap.set('n', '<leader>xG', '<cmd>source %<cr>', { desc = 'Source file' })
vim.keymap.set({'n', 'v'}, '<leader>xl', ':.lua<cr>', { desc = 'Lua execute line' })

vim.keymap.set('n', '<leader>u', vim.pack.update, { desc = 'Update packages' })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>w', ':w<cr>', { desc = 'Save file' })

vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', function() require("flash").jump() end, { desc = 'Flash jump' })
vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', function() require("flash").treesitter() end, { desc = 'Flash treesitter' })

vim.keymap.set('n', '<leader>t', ':lua MiniTrailspace.trim()<cr>', { desc = 'Trim whitespace' })

if not vim.g.vscode then
  vim.keymap.set('n', '-', ':lua MiniFiles.open()<cr>', { desc = 'File Browser' } )
  local rhs = '<Cmd>lua MiniGit.show_at_cursor()<CR>'
  vim.keymap.set({ 'n', 'x' }, '<Leader>gs', rhs, { desc = 'Show at cursor' })

  vim.keymap.set('n', '<leader>f', function () Snacks.picker.files() end, { desc = 'Find files' } )
  vim.keymap.set('n', '<leader>b', function () Snacks.picker.buffers() end, { desc = 'Find buffers' } )
  vim.keymap.set('n', '<leader>h', function () Snacks.picker.help() end, { desc = 'Find help' } )

  vim.keymap.set('n', '<leader>gS', ':Neogit<cr>', { desc = 'Neogit' } )
  vim.keymap.set('n', '<leader>gl', function () Snacks.lazygit() end, { desc = 'Lazygit' } )

  vim.keymap.set('n', '<leader>sb', function() Snacks.picker.lines() end, { desc = 'Buffer Lines' } )
  vim.keymap.set('n', '<leader>sB', function() Snacks.picker.grep_buffers() end, { desc = 'Grep Open Buffers' } )
  vim.keymap.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = 'Grep' } )
  vim.keymap.set({'n', 'x'}, '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection or word' })

  vim.keymap.set('n', '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })
  vim.keymap.set('n', '<leader>oA', function() require('opencode').ask() end, { desc = 'Ask opencode' })
  vim.keymap.set('n', '<leader>oa', function() require('opencode').ask('@cursor: ') end, { desc = 'Ask opencode about this' })
  vim.keymap.set('v', '<leader>oa', function() require('opencode').ask('@selection: ') end, { desc = 'Ask opencode about selection' })
  vim.keymap.set('n', '<leader>on', function() require('opencode').command('session_new') end, { desc = 'New opencode session' })
  vim.keymap.set('n', '<leader>oy', function() require('opencode').command('messages_copy') end, { desc = 'Copy last opencode response' })
  vim.keymap.set('n', '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, { desc = 'Messages half page up' })
  vim.keymap.set('n', '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, { desc = 'Messages half page down' })
  vim.keymap.set({ 'n', 'v' }, '<leader>os', function() require('opencode').select() end, { desc = 'Select opencode prompt' })

  vim.keymap.set('n', '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, { desc = 'Explain this code' })
end
