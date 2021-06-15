require('config.colorscheme')
require('config.completion')
require('config.versioncontrol')
require('config.compe')

require('lualine').setup {
    options = { theme = 'nightfly' },
    sections = { lualine_b = {'branch', 'diff'}, lualine_c = {'filename', require('lsp-status').status} }
}

require('neogit').setup {}
require('gitsigns').setup {}

-------------------- TREE-SITTER ---------------------------
local ts = require('nvim-treesitter.configs')
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

if (vim.fn.exists('g:neovide')) then
    local g = vim.g
    vim.cmd 'set guifont=Iosevka:h18'
    g.neovide_cursor_animation_length=0
    g.neovide_cursor_trail=0
end
