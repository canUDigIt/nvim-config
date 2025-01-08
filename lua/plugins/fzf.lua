return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  version = false,
  opts = {},
  config = function(opts)
    require('fzf-lua').setup(opts)
    vim.keymap.set('n', '<leader>/', '<cmd>FzfLua lines<cr>', { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua buffers<cr>', { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sc', '<cmd>FzfLua colorschemes<cr>', { desc = '[S]earch [C]olorschemes' })
    vim.keymap.set('n', '<leader>sf', '<cmd>FzfLua files<cr>', { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', '<cmd>FzfLua grep<cr>', { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sl', '<cmd>FzfLua live_grep<cr>', { desc = '[S]earch by [G]rep Live' })
    vim.keymap.set('n', '<leader>sh', '<cmd>FzfLua helptags<cr>', { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sr', '<cmd>FzfLua resume<cr>', { desc = '[S]earch [R]esume' })
  end,
}
