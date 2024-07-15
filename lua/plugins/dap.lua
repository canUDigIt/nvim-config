return {
  {
    'rcarriga/nvim-dap-ui',
    config = function(_, opts)
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup(opts)

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.after.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.after.event_exited['dapui_config'] = function()
        dapui.close {}
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
          program = '${command:pickFile}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.configurations.zig = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = '${command:pickFile}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      require('nvim-dap-projects').search_project_config()

      local function set_breakpoint_on_condition ()
        require'dap'.set_breakpoint(vim.fn.input({'Breakpoint condition: '}))
      end

      local function set_breakpoint_message ()
        require'dap'.set_breakpoint(nil, nil, vim.fn.input({'Log point message: '}))
      end

      vim.keymap.set('n', '<leader>dc', require'dap'.continue, {desc = 'continue'})
      vim.keymap.set('n', '<leader>dn', require'dap'.step_over, {desc = 'step over'})
      vim.keymap.set('n', '<leader>di', require'dap'.step_into, {desc = 'step into'})
      vim.keymap.set('n', '<leader>df', require'dap'.step_out, {desc = 'step out'})
      vim.keymap.set('n', '<leader>db', require'dap'.toggle_breakpoint, {desc = 'toggle breakpoint'})
      vim.keymap.set('n', '<leader>dB', set_breakpoint_on_condition, {desc = 'breakpoint condition'})
      vim.keymap.set('n', '<leader>dlp', set_breakpoint_message, {desc = 'breakpoint message'})
      vim.keymap.set('n', '<leader>dr', require'dap'.repl.open, {desc = 'reple open'})
      vim.keymap.set('n', '<leader>dR', require'dap'.run_last, {desc = 'run last'})
    end,
    opt = {},
    dependencies = {
      'mfussenegger/nvim-dap',
      'ldelossa/nvim-dap-projects',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
    }
  },
}
