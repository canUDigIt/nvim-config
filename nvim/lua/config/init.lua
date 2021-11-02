require('config.colorscheme')
require('config.cmp')

require('nvim-autopairs').setup{}
require('nvim-ts-autotag').setup{}

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
  open_mapping = [[<c-t>]],
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

require('lualine').setup {
    options = { theme = 'nightfox' }
}

local ts = require('nvim-treesitter.configs')
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

require('telescope').setup {
    defaults = {
	layout_config = {
		vertical = { width = 0.5 }
	},
        file_ignore_patterns = {'debug', 'release','build', 'node_modules'}
    },
    extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
    }
}
require('telescope').load_extension('fzf')
