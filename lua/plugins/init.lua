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
    build = ':TSUpdate',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'tsakirist/telescope-lazy.nvim',
    },
    opts = {
      defaults = {
        file_ignore_patterns = { 'debug/', 'release/', 'build/', 'node_modules/' }
      }
    },
  },
  'natecraddock/telescope-zf-native.nvim',

  -- Colorschemes
  'EdenEast/nightfox.nvim',
  'folke/tokyonight.nvim',
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim"
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
    "cshuaimin/ssr.nvim",
    name = "ssr",
    opts = {
      border = "rounded",
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader><cr>",
      },
    }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = { open_mapping = '<c-t>' },
  },
  { 'echasnovski/mini.nvim', version = false },
  'gennaro-tedesco/nvim-peekup',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap'
  },
  'ldelossa/nvim-dap-projects',
  'mfussenegger/nvim-dap-python',
  'ziglang/zig.vim',
  'Civitasv/cmake-tools.nvim',
  'p00f/clangd_extensions.nvim'
}
