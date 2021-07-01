local utils = require('utils')

utils.opt('o', 'completeopt', 'menuone,noselect')
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}-- <Tab> to navigate the completion menu
