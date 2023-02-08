require('nvim-autopairs').setup {}
require('nvim-ts-autotag').setup {}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "cmake", "help", "lua", "python", "rust", "typescript", "vim", "zig" },
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

require('telescope').setup {
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    },
    file_ignore_patterns = { 'debug', 'release', 'build', 'node_modules' }
  },
  extensions = {
  }
}
require('telescope').load_extension('zf-native')

require('fidget').setup {}

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

local port = 13000
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
    args = {'--port', '${port}'}
  }
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input({'Path to executable: ', vim.fn.getcwd() .. '/', 'file'})
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
