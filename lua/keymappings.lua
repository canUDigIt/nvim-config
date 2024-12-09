local wk = require('which-key')
wk.add({
  { "<c-l>", "<cmd>noh<cr>", desc = "No Highlight" },
})

-- Searching keys
wk.add({
  { "<leader>/", MiniPick.builtin.buf_lines, desc = "[/] Fuzzily search in current buffer]" },
  { "<leader><space>", MiniPick.builtin.buffers, desc = "[ ] Find existing buffers" },
  { "<leader>s", group = "Search" },
  { "<leader>sf", MiniPick.builtin.files, desc = "[S]earch [F]iles" },
  { "<leader>sg", MiniPick.builtin.grep, desc = "[S]earch by [G]rep" },
  { "<leader>sh", MiniPick.builtin.help, desc = "[S]earch [H]elp" },
})

-- Version control
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
  { "<leader>h", group = "Hunk" },
})
