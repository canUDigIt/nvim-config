vim.g.mapleader = ' '

local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd 'packadd packer.nvim'
cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('plugins')

-- Sensible defaults
require('settings')

-- Key mappings
require('keymappings')

-- Configuration
require('config')

-- LSP
require('lang')
