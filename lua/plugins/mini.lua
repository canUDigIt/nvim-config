return {
  {
    'echasnovski/mini.ai',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.align',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.bracketed',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.clue',
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end,
  },
  {
    'echasnovski/mini.extra',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.files',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.operators',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.pairs',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.starter',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.statusline',
    config = true,
    version = false
  },
  {
    'echasnovski/mini.surround',
    config = true,
    version = false
  },
}
