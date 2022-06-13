local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    }
    print "Installing packer...close and reopen Neovim"
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display ={
    open_fn = function ()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind-nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-emoji'

    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'natecraddock/telescope-zf-native.nvim'

    -- Colorschemes
    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'fenetikm/falcon'
    use 'EdenEast/nightfox.nvim'
    use 'kvrohit/substrata.nvim'
    use "rebelot/kanagawa.nvim"
    use "sainnhe/everforest"
    use{
      "catppuccin/nvim",
      as = "catppuccin"
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function () require'user.config.statusline' end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use "lukas-reineke/indent-blankline.nvim"

    -- Version Control
    use { 'tpope/vim-fugitive' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Functionality
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use {
      'folke/which-key.nvim',
      config = function ()
        require("which-key").setup{}
      end
    }
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {}
        end
    }
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require('colorizer').setup()
        end
    }
    use 'gennaro-tedesco/nvim-peekup'
    use 'p00f/nvim-ts-rainbow'

    -- Navigational plugins
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup{} end
    }
    use {"akinsho/toggleterm.nvim"}

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
end)

