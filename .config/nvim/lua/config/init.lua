require('config.colorscheme')
require('config.completion')
require('config.versioncontrol')
require('config.compe')
require('config.saga')
require('config.spectre')

require('neogit').setup {}
require('gitsigns').setup {}
require('toggleterm').setup {
    -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
}

-------------------- TREE-SITTER ---------------------------
local ts = require('nvim-treesitter.configs')
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

if (vim.fn.exists('g:neovide')) then
    local g = vim.g
    vim.cmd 'set guifont=Iosevka:h18'
    g.neovide_cursor_animation_length=0
    g.neovide_cursor_trail=0
end
