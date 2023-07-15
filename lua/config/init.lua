require('mini.ai').setup {}
require('mini.align').setup {}
require('mini.bracketed').setup {}
require('mini.comment').setup {}
require('mini.pairs').setup {}
require('mini.starter').setup {}
require('mini.files').setup {}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "cmake", "lua", "python", "rust", "typescript", "vim", "zig" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  textobjects = {
    select = {
      enable    = true,
      lookahead = true,
      keymaps   = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader>a"] = "@parameter.inner", },
      swap_previous = { ["<leader>A"] = "@parameter.inner", },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

require('telescope').load_extension('zf-native')
require('telescope').load_extension('lazy')

-- debugging
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open{}
end
dap.listeners.after.event_terminated['dapui_config'] = function()
  dapui.close{}
end
dap.listeners.after.event_exited['dapui_config'] = function()
  dapui.close{}
end

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
}
require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp', 'rust'} })

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
