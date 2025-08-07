vim.pack.add({
  { src = 'https://github.com/kevinhwang91/nvim-bqf' },
  { src = 'https://github.com/rktjmp/lush.nvim' },
  { src = 'https://github.com/mcchrish/zenbones.nvim' },
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/greggh/claude-code.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/folke/snacks.nvim' },
  { src = 'https://github.com/Saghen/blink.cmp' },
  { src = 'https://github.com/NeogitOrg/neogit' },
})

-- Setup plugins
require('blink.cmp').setup({
  snippets = { preset = 'mini_snippets' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})

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

require('mini.diff').setup()
require('mini.icons').setup()
require('mini.files').setup()

require('mini.operators').setup({
  replace = {
    prefix = '<leader>r',
  },
})

require('mini.snippets').setup()

require('mini.pairs').setup()
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.trailspace').setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "cmake", "lua", "markdown", "markdown_inline", "odin", "python", "rust", "typescript", "vim", "zig" },
  highlight = {
  enable = true,
  },
}

require('mason').setup()

require('claude-code').setup({
  keymaps = {
    toggle = {
      normal = '<C-;>',
      terminal = '<C-;>',
    },
  },
})

require('snacks').setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = false },
  indent = { enabled = false },
  input = { enabled = false },
  lazygit = { enabled = true },
  notifier = {
    enabled = false,
    timeout = 3000,
  },
  picker = { enabled = true },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
  styles = {
    notification = {
      -- wo = { wrap = true } -- Wrap notifications
    }
  }
})
