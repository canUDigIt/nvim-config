require('config.colorscheme')
require('config.completion')
require('config.versioncontrol')
require('config.compe')

require('hardline').setup {}
require('neogit').setup {}
require('gitsigns').setup {}

-------------------- TREE-SITTER ---------------------------
local ts = require('nvim-treesitter.configs')
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
