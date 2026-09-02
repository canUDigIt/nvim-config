local vscode = vim.g.vscode ~= nil

-- Plugins needed everywhere, including inside the VSCode extension host
local common_plugins = {
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
}

-- Plugins only relevant to standalone Neovim
local editor_plugins = {
  { src = 'https://github.com/rktjmp/lush.nvim' },
  { src = 'https://github.com/mcchrish/zenbones.nvim' },
  { src = 'https://github.com/oskarnurm/koda.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/stevearc/quicker.nvim' },
  { src = 'https://github.com/stevearc/overseer.nvim' },
  { src = 'https://github.com/numtostr/comment.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
}

local plugins = vim.deepcopy(common_plugins)
if not vscode then
  vim.list_extend(plugins, editor_plugins)
end
vim.pack.add(plugins)

-- ── Shared setup (both standalone Neovim and VSCode) ──────────────────
require('mini.extra').setup()

local gen_spec = require('mini.ai').gen_spec
local gen_ai_spec = require('mini.extra').gen_ai_spec
require('mini.ai').setup({
  custom_textobjects = {
    B = gen_ai_spec.buffer(),
    D = gen_ai_spec.diagnostic(),
    I = gen_ai_spec.indent(),
    L = gen_ai_spec.line(),
    N = gen_ai_spec.number(),
    F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
  },
})

require('mini.align').setup()
require('mini.operators').setup({
  replace = {
    prefix = '<leader>r',
  },
})
require('mini.pairs').setup()
require('mini.surround').setup()

-- ── Standalone-Neovim-only setup (skipped under VSCode) ───────────────
if not vscode then
  require('vim._core.ui2').enable()

  require('Comment').setup()

  local projects = require('projects')
  projects.setup({
    roots = { '~/workspaces' },
  })

  require('gitsigns').setup{
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end, { desc = 'Next Hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end, { desc = 'Prev Hunk' })

      -- Text object
      map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'Select Hunk' })
    end
  }

  require("diffview").setup()
  require("neogit").setup()

  require("oil").setup()
  require("quicker").setup({
    keys = {
      { ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
      { "<", "<cmd>lua require('quicker').collapse()<CR>", desc = "Collapse quickfix content" },
    },
  })
  require("overseer").setup()

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
      { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
      { mode = 'n', keys = '<Leader>g', desc = '+Git' },
      { mode = 'n', keys = '<Leader>h', desc = '+Hunks' },
      { mode = 'n', keys = '<Leader>p', desc = '+Project/Packages' },
      { mode = 'n', keys = '<Leader>s', desc = '+Search / Replace' },
      { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
      { mode = 'n', keys = '<Leader>x', desc = '+Execute' },
    },
  })

  require('mini.icons').setup()
  require('mini.input').setup()

  local gen_loader = require('mini.snippets').gen_loader
  require('mini.snippets').setup({
    snippets = {
      -- Load custom file with global snippets first
      gen_loader.from_file('~/.config/nvim/snippets/global.json'),

      -- Load snippets based on current language by reading files from
      -- `snippets/` subdirectories from 'runtimepath' directories.
      gen_loader.from_lang(),
    }
  })

  require('mini.pick').setup()
  require('mini.visits').setup()
  require('mini.statusline').setup()
  require('mini.trailspace').setup()

  local types = { 'lua', 'python', 'c', 'cpp', 'odin', 'kotlin', 'java' }
  require('nvim-treesitter').install(types)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = types,
    callback = function()
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start()
      -- folds, provided by Neovim
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end
