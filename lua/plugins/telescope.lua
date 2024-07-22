return {
  {
    'nvim-telescope/telescope.nvim',
    config = function ()
      require('telescope').load_extension('zf-native')
      require('telescope').load_extension('lazy')
    end,
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'tsakirist/telescope-lazy.nvim',
      'natecraddock/telescope-zf-native.nvim',
    },
    opts = {
      defaults = {
        file_ignore_patterns = { 'debug/', 'release/', 'build/', 'node_modules/' }
      }
    },
  },
}
