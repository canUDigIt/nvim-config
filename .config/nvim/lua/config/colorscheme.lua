local utils = require('utils')

utils.opt('o', 'termguicolors', true)

vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false

require('material').set()

require('lualine').setup {
    options = { theme = 'material-nvim' },
    sections = {
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename', require('lsp-status').status}
    }
}

vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
