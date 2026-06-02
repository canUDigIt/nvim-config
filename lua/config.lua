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
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
    end,
  })
end
