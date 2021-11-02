local indent = 4

vim.cmd [[syntax enable]]
vim.cmd [[filetype plugin indent on]]

vim.bo.expandtab = true
vim.bo.shiftwidth = indent
vim.bo.smartindent = true
vim.bo.tabstop = indent
vim.o.expandtab = true
vim.o.shiftwidth = indent
vim.o.smartindent = true
vim.o.tabstop = indent

vim.o.hidden = true
vim.o.ignorecase = true
vim.o.shiftround = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.number = true
vim.wo.relativenumber = true

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
