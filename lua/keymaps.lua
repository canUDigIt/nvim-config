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
  vim.keymap.set('n', '<leader>gd', '<Cmd>DiffviewOpen<CR>', { desc = 'Diffview Working Tree' })
  vim.keymap.set('n', '<leader>gh', '<Cmd>DiffviewFileHistory %<CR>', { desc = 'Diffview File History' })
  vim.keymap.set('n', '<leader>gq', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' })

  vim.keymap.set('n', '<leader>sf', function() MiniPick.builtin.files() end, { desc = 'Find files' } )
  vim.keymap.set('n', '<leader>sb', function() MiniPick.builtin.buffers() end, { desc = 'Find buffers' } )
  vim.keymap.set('n', '<leader>sh', function() MiniPick.builtin.help() end, { desc = 'Find help' } )
  vim.keymap.set('n', '<leader>sl', function() MiniExtra.pickers.buf_lines() end, { desc = 'Buffer Lines' } )
  vim.keymap.set('n', '<leader>so', function() MiniPick.builtin.grep() end, { desc = 'Grep Open Buffers' } )
  vim.keymap.set('n', '<leader>sg', function() MiniPick.builtin.grep_live() end, { desc = 'Grep' } )
  vim.keymap.set({'n', 'x'}, '<leader>sw', function() MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>')}) end, { desc = 'Visual selection or word' })

  local function set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  end

  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*toggleterm#*',
    callback = set_terminal_keymaps,
  })

  vim.keymap.set('n', '<leader>ta', '<Cmd>ToggleTermToggleAll<CR>', { desc = 'Toggle All Terminals' })
  vim.keymap.set('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle Float Terminal' })
  vim.keymap.set('n', '<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle Horizontal Terminal' })
  vim.keymap.set('n', '<leader>tv', '<Cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle Vertical Terminal' })
  vim.keymap.set('n', '<leader>tn', '<Cmd>TermNew<CR>', { desc = 'New Terminal' })
  vim.keymap.set('n', '<leader>tp', '<Cmd>TermSelect<CR>', { desc = 'Pick Terminal' })
  vim.keymap.set('n', '<leader>tN', '<Cmd>ToggleTermSetName<CR>', { desc = 'Set Terminal Name' })
  vim.keymap.set('n', '<leader>tl', '<Cmd>ToggleTermSendCurrentLine<CR>', { desc = 'Send Current Line to Terminal' })
  vim.keymap.set('v', '<leader>tl', '<Cmd>ToggleTermSendVisualLines<CR>', { desc = 'Send Visual Lines to Terminal' })
  vim.keymap.set('v', '<leader>ts', '<Cmd>ToggleTermSendVisualSelection<CR>', { desc = 'Send Visual Selection to Terminal' })
end
