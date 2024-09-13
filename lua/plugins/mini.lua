return {
  {
    'echasnovski/mini.ai',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.align',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.bracketed',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.extra',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.pairs',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.starter',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.pick',
    opts = {},
    version = false
  },
  {
    'echasnovski/mini.files',
    opts = {
      options = {
        permanent_delete = false,
      }
    },
    keys = {
      { "<leader>fb", function ()
        MiniFiles.open()
      end, desc = "Mini Files" }
    },
    dependencies = {
      { 'echasnovski/mini.icons', version = false },
    },
    version = false
  },
}
