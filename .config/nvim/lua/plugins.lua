return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-compe'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
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

    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

    -- Version Control
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Functionality
    use 'b3nj5m1n/kommentary'
    use 'jiangmiao/auto-pairs'
    use 'junegunn/vim-easy-align'
    use 'ntpeters/vim-better-whitespace'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'AndrewRadev/splitjoin.vim'
    use {
        'windwp/nvim-spectre',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- Navigational plugins
    use 'mhinz/vim-startify'
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use {"akinsho/nvim-toggleterm.lua"}

end)

