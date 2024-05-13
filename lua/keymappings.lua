local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local wk = require('which-key')
wk.register({
  ['<c-l>'] = { '<cmd>noh<cr>', 'No Highlight' },
})

-- Searching keys
wk.register({
  ['<leader>'] = {
    ['?'] = { function() builtin.oldfiles() end, '[?] Find recently opened files' },
    ['<space>'] = { function() builtin.buffers() end, '[ ] Find existing buffers' },
    ['/'] = { function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, '[/] Fuzzily search in current buffer]' },
    s = {
      name = 'search',
      f = { function () builtin.find_files(themes.get_dropdown()) end, '[S]earch [F]iles' },
      h = { function() builtin.help_tags(themes.get_dropdown()) end, '[S]earch [H]elp' },
      w = { function () builtin.grep_string(themes.get_dropdown()) end, '[S]earch current [W]ord' },
      g = { function () builtin.live_grep(themes.get_dropdown()) end, '[S]earch by [G]rep' },
      d = { function ()builtin.diagnostics(themes.get_dropdown()) end, '[S]earch [D]iagnostics' },
    },
  },
})

-- Version control
wk.register({
  ['<leader>'] = {
    g = {
      name = 'Git',
      s = {  '<cmd>Neogit<cr>', 'Git Status' },
    },
    h = { name = 'Hunk' }
  },
})
