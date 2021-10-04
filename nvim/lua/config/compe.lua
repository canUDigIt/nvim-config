-- Configuration for nvim-compe

local utils = require('utils')

vim.cmd [[set shortmess+=c]]
utils.opt('o', 'completeopt', 'menuone,noselect')

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    source = {
        path = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

local nest = require('nest')
nest.applyKeymaps {
    {mode = 'i', {
        options = {expr = true}, {
            {'<C-Space>', 'compe#complete()'},
            {'<CR>', [[compe#confirm('<CR>')]]},
            {'<C-e>', [[compe#close('<C-e>')]]},
            {'<C-f>', [[compe#scroll({ 'delta': +4 })]]},
            {'<C-d>', [[compe#scroll({ 'delta': -4 })]]},
        },
    }},
}

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
