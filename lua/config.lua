vim.lsp.enable('basedpyright')
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ols')

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

if not vim.g.vscode then
  vim.cmd("colorscheme zenbones")

  -- Listen for opencode events
  vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent",
    callback = function(args)
      -- See the available event types and their properties
      vim.notify(vim.inspect(args.data), vim.log.levels.DEBUG)
      -- Do something interesting, like show a notification when opencode finishes responding
      if args.data.type == "session.idle" then
        vim.notify("opencode finished responding", vim.log.levels.INFO)
      end
    end,
  })
end
