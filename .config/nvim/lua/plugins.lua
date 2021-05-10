return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'onsails/lspkind-nvim'
    use {
      'folke/lsp-trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use 'hrsh7th/nvim-compe'
    use 'anott03/nvim-lspinstall'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'fenetikm/falcon'

    use { 'ojroques/nvim-hardline' }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

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
    use 'ryanoasis/vim-devicons'
end)

