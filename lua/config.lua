vim.diagnostic.config({
  virtual_text = { current_line = true },
  severity_sort = true,
})

if not vim.g.vscode then
  vim.cmd("colorscheme zenbones")
end
