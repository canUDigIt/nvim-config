return {
  -- Lsp
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'onsails/lspkind-nvim',
  'j-hui/fidget.nvim',
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

  {
    'nvim-lualine/lualine.nvim',
    config = function() require 'config.statusline' end,
  },

  -- Version Control
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup{
        on_attach = function (bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end,
  },

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
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  },
  'gennaro-tedesco/nvim-peekup',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap'
  },
  'mfussenegger/nvim-dap-python',
  'ziglang/zig.vim',

  -- Navigational plugins
  "akinsho/toggleterm.nvim",
}
