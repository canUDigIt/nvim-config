local utils = require('utils')
require('spectre').setup()

utils.map("n", "<leader>S", [[<Cmd>lua require('spectre').open()<CR>]])
utils.map("n", "<leader>sw", [[<Cmd>lua require('spectre').open_visual()<CR>]])
utils.map("v", "<leader>s", [[<Cmd>lua require('spectre').open_visual()<CR>]])
utils.map("n", "<leader>sp", [[<Cmd>lua require('spectre').open_file_search()<CR>]])
