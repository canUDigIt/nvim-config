require('mini.ai').setup {}
require('mini.align').setup {}
require('mini.bracketed').setup {}
require('mini.comment').setup {}
require('mini.pairs').setup {}
require('mini.starter').setup {}

require('oil').setup {}

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
require('telescope').load_extension('noice')

-- noice

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

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

dap.adapters.lldb = {
  name = 'lldb',
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('nvim-dap-projects').search_project_config()
