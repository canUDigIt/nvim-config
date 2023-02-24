vim.g.neo_tree_remove_legacy_commands = 1

return {
'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
      filesystem = {
        hijack_netrw_behavior = "open_current",
      }
  },
}
