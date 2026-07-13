if vim.g.vscode then
  vim.pack.add({
    { src = 'https://github.com/folke/flash.nvim' },
    { src = 'https://github.com/echasnovski/mini.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
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
  require('mini.operators').setup({
    replace = {
      prefix = '<leader>r',
    },
  })

  require('mini.pairs').setup()
  require('mini.surround').setup()
else
  vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/kevinhwang91/nvim-bqf' },
    { src = 'https://github.com/rktjmp/lush.nvim' },
    { src = 'https://github.com/mcchrish/zenbones.nvim' },
    { src = 'https://github.com/folke/flash.nvim' },
    { src = 'https://github.com/echasnovski/mini.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/NeogitOrg/neogit' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim'},
    { src = 'https://github.com/sindrets/diffview.nvim'},
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim'},
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/MagicDuck/grug-far.nvim'},
  })

  -- Setup plugins
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

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Stage Hunk' })

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Reset Hunk' })

      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Buffer' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset Buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview Hunk Inline' })

      map('n', '<leader>hb', function()
        gitsigns.blame_line({ full = true })
      end, { desc = 'Blame Line' })

      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff This Index' })

      map('n', '<leader>hD', function()
        gitsigns.diffthis('~')
      end, { desc = 'Diff This Head' })

      map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'All Hunks to Quickfix List' })
      map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Current Buffer Hunks to Quickfix List' })

      -- Toggles
      map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Current Line Blame' })
      map('n', '<leader>gw', gitsigns.toggle_word_diff, { desc = 'Toggle Word Diff' })

      -- Text object
      map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'Select Hunk' })
    end
  }

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
  require('mini.completion').setup {
    lsp_completion = { source_func = 'omnifunc', auto_setup = false }
  }

  require('mini.pairs').setup()
  require('mini.pick').setup()
  require('mini.starter').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup()
  require('mini.trailspace').setup()

  require('nvim-treesitter').setup()
  require('nvim-treesitter').install{ 'lua', 'python', 'c', 'cpp', 'odin' }
end
