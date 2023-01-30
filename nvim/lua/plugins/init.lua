return {
  -- Lsp
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'onsails/lspkind-nvim',
  'j-hui/fidget.nvim',
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
  'bluz71/vim-nightfly-guicolors',
  'bluz71/vim-moonfly-colors',
  'fenetikm/falcon',
  'EdenEast/nightfox.nvim',
  'kvrohit/substrata.nvim',
  'ellisonleao/gruvbox.nvim',
  'eemed/sitruuna.vim',
  'folke/tokyonight.nvim',
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  'savq/melange-nvim',

  -- Visual
  {
    'nvim-lualine/lualine.nvim',
    config = function() require 'config.statusline' end,
  },

  -- Version Control
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Functionality
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  {
    'phaazon/hop.nvim',
    name = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
  },
  'gennaro-tedesco/nvim-peekup',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap'
  },
  'mfussenegger/nvim-dap-python',
  'ziglang/zig.vim',
}
