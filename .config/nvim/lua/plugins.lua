return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-compe'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'tjdevries/nlua.nvim'

    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'fenetikm/falcon'

    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

    use 'b3nj5m1n/kommentary'

    use 'elixir-editors/vim-elixir'

    use 'jiangmiao/auto-pairs'
    use 'junegunn/vim-easy-align'
    use 'ntpeters/vim-better-whitespace'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'AndrewRadev/splitjoin.vim'

    -- Writing plugins
    use 'vimwiki/vimwiki'
    use 'junegunn/limelight.vim'
    use 'junegunn/goyo.vim'

    -- Navigational plugins
    use 'mhinz/vim-startify'
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
end)

