return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.extra').setup()

    local gen_ai_spec = require('mini.extra').gen_ai_spec
    require('mini.ai').setup({
      custom_textobjects = {
        D = gen_ai_spec.diagnostic(),
        I = gen_ai_spec.indent(),
        L = gen_ai_spec.line(),
        N = gen_ai_spec.number(),
      },
    })

    require('mini.align').setup()
    require('mini.icons').setup()

    require('mini.files').setup()
    vim.keymap.set('n', '-', ':lua MiniFiles.open()<cr>', { desc = 'File Browser' } )

    require('mini.operators').setup({
      replace = {
        prefix = '<leader>gr',
      },
    })
    require('mini.pairs').setup()
    require('mini.starter').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup()
  end,
}
