vim.keymap.set('n', '<c-l>', vim.cmd.noh, { desc = 'No Highlight' })

vim.keymap.set('n', '<leader>xg', function() vim.cmd.source{ '%' } end, { desc = 'Source file' })
vim.keymap.set({'n', 'v'}, '<leader>xl', function() vim.cmd('.lua') end, { desc = 'Lua execute line' })

vim.keymap.set('n', '<leader>u', vim.pack.update, { desc = 'Update packages' })

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>bs', vim.cmd.write, { desc = 'Save file' })

local flash = require('flash')
vim.keymap.set({'n', 'x', 'o'}, '<leader>sj', flash.jump, { desc = 'Flash jump' })
vim.keymap.set({'n', 'x', 'o'}, '<leader>sJ', flash.treesitter, { desc = 'Flash treesitter' })

if not vim.g.vscode then
  vim.keymap.set('n', '-', MiniFiles.open, { desc = 'File Browser' } )

  vim.keymap.set('n', '<leader>gg', vim.cmd.Neogit, { desc = 'Neogit' } )
  vim.keymap.set('n', '<leader>gd', '<Cmd>DiffviewOpen<CR>', { desc = 'Diffview Working Tree' })
  vim.keymap.set('n', '<leader>gh', '<Cmd>DiffviewFileHistory %<CR>', { desc = 'Diffview File History' })
  vim.keymap.set('n', '<leader>gq', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' })

  local projects = require('projects')
  vim.keymap.set('n', '<leader>pp', projects.select, { desc = 'Select Project' })
  vim.keymap.set('n', '<leader>pP', projects.select_from_directory, { desc = 'Find Projects in Directory' })

  vim.keymap.set('n', '<leader>bt', MiniTrailspace.trim, { desc = 'Trim whitespace' })

  local grug_far = require('grug-far')
  local function open_grug_far(opts)
    opts = opts or {}
    opts.prefills = vim.tbl_deep_extend('force', { paths = vim.fn.getcwd() }, opts.prefills or {})
    grug_far.open(opts)
  end

  vim.keymap.set('n', '<leader>sr', open_grug_far, { desc = 'Search and Replace' })
  vim.keymap.set('n', '<leader>sR', function()
    open_grug_far({ prefills = { search = vim.fn.expand('<cword>') } })
  end, { desc = 'Replace Word' })
  vim.keymap.set('x', '<leader>sr', function()
    grug_far.with_visual_selection({ prefills = { paths = vim.fn.getcwd() } })
  end, { desc = 'Replace Selection' })
  vim.keymap.set('n', '<leader>sa', function()
    open_grug_far({ engine = 'astgrep' })
  end, { desc = 'Structural Search and Replace' })

  vim.keymap.set('n', '<leader>sf', MiniPick.builtin.files, { desc = 'Find files' } )
  vim.keymap.set('n', '<leader>sb', MiniPick.builtin.buffers, { desc = 'Find buffers' } )
  vim.keymap.set('n', '<leader>sh', MiniPick.builtin.help, { desc = 'Find help' } )
  vim.keymap.set('n', '<leader>sl', MiniExtra.pickers.buf_lines, { desc = 'Buffer Lines' } )
  vim.keymap.set('n', '<leader>so', MiniPick.builtin.grep, { desc = 'Grep Open Buffers' } )
  vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live, { desc = 'Grep' } )
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
