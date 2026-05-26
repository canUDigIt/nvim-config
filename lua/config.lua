vim.lsp.enable('ty')
vim.lsp.enable('clangd')
vim.lsp.enable('kotlin_lsp')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ols')

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

if not vim.g.vscode then
  vim.cmd("colorscheme zenbones")

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(ev)
      local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
      if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
      end
    end,
  })
end
