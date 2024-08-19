return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function (_, opts)
      require('toggleterm').setup(opts);

      function _G.set_terminal_keymaps()
        local map_opts = {buffer = 0}
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], map_opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], map_opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], map_opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], map_opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], map_opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
    opts = { open_mapping = [[<C-t>]] },
  },
}
