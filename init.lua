require('options')

-- Packages
vim.pack.add({
  { src = 'https://github.com/kevinhwang91/nvim-bqf' },
  { src = 'https://github.com/rktjmp/lush.nvim' },
  { src = 'https://github.com/mcchrish/zenbones.nvim' },
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
})

-- Configuration
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

require('mini.operators').setup({
  replace = {
    prefix = '<leader>r',
  },
})
require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.surround').setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "cmake", "lua", "markdown", "markdown_inline", "odin", "python", "rust", "typescript", "vim", "zig" },
  highlight = {
  enable = true,
  },
}

require('mason').setup()

require('keymaps')
require('lsp-config')

vim.cmd("colorscheme zenbones")
