return {
  {
    'nvim-telescope/telescope.nvim',
    config = function ()
      require('telescope').load_extension('zf-native')
      require('telescope').load_extension('lazy')
      require('telescope').load_extension('noice')

      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      local builtin = require('telescope.builtin')
      local themes = require('telescope.themes')
      vim.keymap.set('n', '<leader>sf', function ()
        builtin.find_files(themes.get_dropdown())
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', function ()
        builtin.help_tags(themes.get_dropdown())
      end, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', function ()
        builtin.grep_string(themes.get_dropdown())
      end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', function ()
        builtin.live_grep(themes.get_dropdown())
      end, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', function ()
        builtin.diagnostics(themes.get_dropdown())
      end, { desc = '[S]earch [D]iagnostics' })
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
