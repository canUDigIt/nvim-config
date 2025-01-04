return {
  {
    'EdenEast/nightfox.nvim'
  },
  {
    'folke/tokyonight.nvim'
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000
  },
  {
    "rebelot/kanagawa.nvim"
  },
  {
    "ellisonleao/gruvbox.nvim", priority = 1000
  },
  {
    "mcchrish/zenbones.nvim",
    config = function ()
      vim.cmd("colorscheme zenbones")
    end,
    dependencies = "rktjmp/lush.nvim"
  },
}
