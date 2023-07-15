local function set_breakpoint_on_condition ()
  require'dap'.set_breakpoint(vim.fn.input({'Breakpoint condition: '}))
end

local function set_breakpoint_message ()
  require'dap'.set_breakpoint(nil, nil, vim.fn.input({'Log point message: '}))
end

vim.keymap.set('n', '<leader>dc', require'dap'.continue, {desc = 'continue'})
vim.keymap.set('n', '<leader>dn', require'dap'.step_over, {desc = 'step over'})
vim.keymap.set('n', '<leader>di', require'dap'.step_into, {desc = 'step into'})
vim.keymap.set('n', '<leader>df', require'dap'.step_out, {desc = 'step out'})
vim.keymap.set('n', '<leader>db', require'dap'.toggle_breakpoint, {desc = 'toggle breakpoint'})
vim.keymap.set('n', '<leader>dB', set_breakpoint_on_condition, {desc = 'breakpoint condition'})
vim.keymap.set('n', '<leader>dlp', set_breakpoint_message, {desc = 'breakpoint message'})
vim.keymap.set('n', '<leader>dr', require'dap'.repl.open, {desc = 'reple open'})
vim.keymap.set('n', '<leader>dR', require'dap'.run_last, {desc = 'run last'})

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
vim.keymap.set('n', '<leader>fb', function ()
  require('mini.files').open()
end, { desc = '[F]ile [B]rowser' })
vim.keymap.set('n', '<leader>sf', function ()
  builtin.find_files(themes.get_ivy())
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', function ()
  builtin.help_tags(themes.get_ivy())
end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function ()
  builtin.grep_string(themes.get_ivy())
end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function ()
  builtin.live_grep(themes.get_ivy())
end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', function ()
  builtin.diagnostics(themes.get_ivy())
end, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', {desc = 'git status'})
vim.keymap.set('n', '<leader>gl', function ()
  local lazygit = require('toggleterm.terminal').Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    hidden = true,
  })
  lazygit:toggle()
end, {desc = 'lazygit'})

vim.keymap.set('n', '<c-l>', '<cmd>noh<cr>', {desc = 'no highlight'})

vim.keymap.set({ 'n', 'x' }, '<leader>sr', function ()
  require('ssr').open()
end)

-- some keymaps for luasnip
local luasnip = require('luasnip')
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
  if luasnip.expand_or_locally_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
  if luasnip.locally_jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<C-l>', function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

-- terminal keymaps
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
