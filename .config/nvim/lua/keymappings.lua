local utils = require('utils')

utils.map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
utils.map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
utils.map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode
