return {
  {
    'tpope/vim-fugitive',
    config = function ()
      vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', {desc = 'git status'})
    end,
  },
}
