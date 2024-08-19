local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local wk = require('which-key')
wk.add({
  { "<c-l>", "<cmd>noh<cr>", desc = "No Highlight" },
  { "<leader>fo", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Clangd switch header" },
})

-- Searching keys
wk.add({
  { "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, desc = "[/] Fuzzily search in current buffer]" },
  { "<leader><space>", function() builtin.buffers() end, desc = "[ ] Find existing buffers" },
  { "<leader>?", function() builtin.oldfiles() end, desc = "[?] Find recently opened files" },
  { "<leader>s", group = "Search" },
  { "<leader>sd", function () builtin.diagnostics(themes.get_dropdown()) end, desc = "[S]earch [D]iagnostics" },
  { "<leader>sf", function () builtin.find_files(themes.get_dropdown()) end, desc = "[S]earch [F]iles" },
  { "<leader>sg", function () builtin.live_grep(themes.get_dropdown()) end, desc = "[S]earch by [G]rep" },
  { "<leader>sh", function () builtin.help_tags(themes.get_dropdown()) end, desc = "[S]earch [H]elp" },
  { "<leader>sw", function () builtin.grep_string(themes.get_dropdown()) end, desc = "[S]earch current [W]ord" },
})

-- Version control
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gs", "<cmd>Neogit<cr>", desc = "Git Status" },
  { "<leader>h", group = "Hunk" },
})  
