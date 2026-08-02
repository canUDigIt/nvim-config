vim.keymap.set('n', '<c-l>', vim.cmd.noh, { desc = 'No Highlight' })

vim.keymap.set('n', '<leader>xg', function() vim.cmd.source{ '%' } end, { desc = 'Source file' })
vim.keymap.set({'n', 'v'}, '<leader>xl', function() vim.cmd('.lua') end, { desc = 'Lua execute line' })

vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = 'Update packages' })
vim.keymap.set('n', '<leader>pd', function()
  local inactives = vim.iter(vim.pack.get())
  :filter(function(x) return not x.active end)
  :map(function(x) return x.spec.name end)
  :totable()
  vim.pack.del(inactives)
end, { desc = 'Delete inactive packages' })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>bs', vim.cmd.write, { desc = 'Save file' })

local flash = require('flash')
vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', flash.jump, { desc = 'Flash jump' })
vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', flash.treesitter, { desc = 'Flash treesitter' })

if not vim.g.vscode then
  vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'File Browser' } )

  vim.keymap.set('n', '<leader>gg', '<Cmd>Git<CR>', { desc = 'Neogit' } )

  local projects = require('projects')
  vim.keymap.set('n', '<leader>pp', projects.select, { desc = 'Select Project' })
  vim.keymap.set('n', '<leader>pP', projects.select_from_directory, { desc = 'Find Projects in Directory' })

  vim.keymap.set('n', '<leader>bt', MiniTrailspace.trim, { desc = 'Trim whitespace' })

  vim.keymap.set('n', '<leader>sf', MiniPick.builtin.files, { desc = 'Find files' } )
  vim.keymap.set('n', '<leader>sb', MiniPick.builtin.buffers, { desc = 'Find buffers' } )
  vim.keymap.set('n', '<leader>sh', MiniPick.builtin.help, { desc = 'Find help' } )
  vim.keymap.set('n', '<leader>sl', MiniExtra.pickers.buf_lines, { desc = 'Buffer Lines' } )
  vim.keymap.set('n', '<leader>sk', MiniExtra.pickers.keymaps, { desc = 'Keymaps' } )
  vim.keymap.set('n', '<leader>sq', function() MiniExtra.pickers.list({ scope = 'quickfix' }) end, { desc = 'Quickfix' } )
  vim.keymap.set('n', '<leader>sL', function() MiniExtra.pickers.list({ scope = 'location' }) end, { desc = 'Locations list' } )
  vim.keymap.set('n', '<leader>sm', MiniExtra.pickers.manpages, { desc = 'Manpages' } )
  vim.keymap.set('n', '<leader>sc', MiniExtra.pickers.colorschemes, { desc = 'Colorschemes' } )
  vim.keymap.set('n', '<leader>sC', MiniExtra.pickers.commands, { desc = 'Commands' } )
  vim.keymap.set('n', '<leader>se', MiniExtra.pickers.explorer, { desc = 'File explorer' } )
  vim.keymap.set('n', '<leader>st', MiniExtra.pickers.treesitter, { desc = 'Treesitter' } )
  vim.keymap.set('n', '<leader>sv', MiniExtra.pickers.visit_paths, { desc = 'Visit Paths' } )
  vim.keymap.set('n', '<leader>so', MiniPick.builtin.grep, { desc = 'Grep Open Buffers' } )
  vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live, { desc = 'Grep' } )
  vim.keymap.set('n', '<leader>sr', MiniPick.builtin.resume, { desc = 'Resume' } )
  vim.keymap.set({'n', 'x'}, '<leader>sw', function() MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>')}) end, { desc = 'Visual selection or word' })

  vim.keymap.set({'n', 'i'}, '<A-h>', [[<Cmd>wincmd h<CR>]])
  vim.keymap.set({'n', 'i'}, '<A-j>', [[<Cmd>wincmd j<CR>]])
  vim.keymap.set({'n', 'i'}, '<A-k>', [[<Cmd>wincmd k<CR>]])
  vim.keymap.set({'n', 'i'}, '<A-l>', [[<Cmd>wincmd l<CR>]])

  local function set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<A-w>', [[<C-\><C-n><C-w>]], opts)
  end

  vim.api.nvim_create_autocmd('TermOpen', {
    callback = set_terminal_keymaps,
  })

  vim.keymap.set('n', '<leader>th', '<Cmd>hor te<CR>', { desc = 'Toggle Horizontal Terminal' })
  vim.keymap.set('n', '<leader>tv', '<Cmd>vert te<CR>', { desc = 'Toggle Vertical Terminal' })
end
