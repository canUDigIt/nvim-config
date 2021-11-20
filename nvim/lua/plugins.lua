return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/nvim-cmp'

    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Colorschemes
    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'fenetikm/falcon'
    use 'marko-cerovac/material.nvim'
    use 'EdenEast/nightfox.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }


    -- Version Control
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
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
    use 'folke/which-key.nvim'
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
	    'goolord/alpha-nvim',
		config = function()
			require'alpha'.setup(require'alpha.themes.startify'.opts)
		end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup{} end
    }
    use {"akinsho/nvim-toggleterm.lua"}

end)

