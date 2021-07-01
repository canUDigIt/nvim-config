local utils = require('utils')
require('lspsaga').init_lsp_saga()

utils.map("n", "gh", [[<Cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], {silent = true})
utils.map("n", "<leader>ca", [[<Cmd>lua require('lspsaga.codeaction').code_action()<CR>]], {silent = true})
utils.map("v", "<leader>ca", [[<Cmd>lua require('lspsaga.codeaction').range_code_action()<CR>]], {silent = true})
utils.map("n", "K", [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], {silent = true})
utils.map("n", "<C-f>", [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], {silent = true})
utils.map("n", "<C-b>", [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], {silent = true})
utils.map("n", "<C-k>", [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], {silent = true})
utils.map("n", "gr", [[<Cmd>lua require('lspsaga.rename').rename()<CR>]], {silent = true})
utils.map("n", "gd", [[<Cmd>lua require('lspsaga.provider').preview_definition()<CR>]], {silent = true})

-- show
utils.map("n", "<leader>cd", [[<Cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>]], {silent = true})
utils.map("n", "<leader>cc", [[<Cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>]], {silent = true})

-- jump diagnostic
utils.map("n", "[d", [[<Cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>]], {silent = true})
utils.map("n", "]d", [[<Cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>]], {silent = true})

