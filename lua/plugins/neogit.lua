return {
  "NeogitOrg/neogit",
  opts = {
    integrations = {
      diffview = true,
      fzf_lua = true,
    }
  },
  config = function(opts)
    require("neogit").setup(opts)
    vim.keymap.set('n', '<leader>ng', ':Neogit<cr>', { desc = '[N]eo[G]it' })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  }
}
