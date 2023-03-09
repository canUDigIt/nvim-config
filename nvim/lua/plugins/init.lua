return {
  -- Lsp
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'onsails/lspkind-nvim',
  {'j-hui/fidget.nvim', config = true},
  'folke/neodev.nvim',

  -- Telescope
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  },
  'natecraddock/telescope-zf-native.nvim',

  -- Colorschemes
  'EdenEast/nightfox.nvim',
  'folke/tokyonight.nvim',
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },

  -- Visual
  {
    'nvim-lualine/lualine.nvim',
    config = function() require 'config.statusline' end,
  },

  -- Version Control
  'tpope/vim-fugitive',

  -- Functionality
  {
    'stevearc/oil.nvim',
    config = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = { open_mapping = '<c-t>' },
  },
  { 'echasnovski/mini.nvim', version = false },
  {
    'phaazon/hop.nvim',
    name = 'hop',
    opts = { keys = 'etovxqpdygfblzhckisuran' },
  },
  'gennaro-tedesco/nvim-peekup',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap'
  },
  'mfussenegger/nvim-dap-python',
  'ziglang/zig.vim',
}
