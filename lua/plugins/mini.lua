return {
  {
    'echasnovski/mini.ai',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.align',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.bracketed',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.extra',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.pairs',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.starter',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.statusline',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.pick',
    version = false,
    config = function()
      require('mini.pick').setup()
      vim.keymap.set('n', '<leader>/', '<cmd>Pick buf_lines<cr>', { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>sb', '<cmd>Pick buffers<cr>', { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sf', '<cmd>Pick files<cr>', { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', '<cmd>Pick grep<cr>', { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sl', '<cmd>Pick grep_live<cr>', { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sh', '<cmd>Pick help<cr>', { desc = '[S]earch [H]elp' })
    end
  },
  {
    'echasnovski/mini.files',
    opts = {
      options = {
        permanent_delete = false,
      }
    },
    config = function(opts)
      require('mini.files').setup(opts)
      vim.keymap.set('n', '<leader>fb', MiniFiles.open, { desc = 'Open Mini file browser' })
    end,
    dependencies = {
      { 'echasnovski/mini.icons', version = false },
    },
    version = false
  },
}
