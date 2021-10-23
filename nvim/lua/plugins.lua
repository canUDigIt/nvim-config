return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    -- Lsp
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'

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
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'tjdevries/nlua.nvim'

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
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Functionality
    use 'b3nj5m1n/kommentary'
    use 'jiangmiao/auto-pairs'
    use 'junegunn/vim-easy-align'
    use 'ntpeters/vim-better-whitespace'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'AndrewRadev/splitjoin.vim'
    use 'LionC/nest.nvim'
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }


    -- Navigational plugins
    use 'mhinz/vim-startify'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup{} end
    }
    use {"akinsho/nvim-toggleterm.lua"}

end)

