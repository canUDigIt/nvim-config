return {
  {
    'nvim-lualine/lualine.nvim',
    config = true,
    opts = {
      options = {
        -- theme = my_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', 'diff' },
        lualine_c = { '%{&ff}' },
        lualine_x = {},
        lualine_y = { '%y', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = { 'fugitive', 'nvim-tree', 'quickfix', 'toggleterm' },
    }
  },
}
