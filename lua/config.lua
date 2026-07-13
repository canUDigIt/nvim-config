vim.lsp.enable('ty')
vim.lsp.enable('clangd')
vim.lsp.enable('kotlin_lsp')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ols')

vim.diagnostic.config({
  virtual_text = { current_line = true },
  severity_sort = true,
})

if not vim.g.vscode then
  vim.cmd("colorscheme zenbones")

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })

      if client and client:supports_method('textDocument/inlayHint') then
        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
      end

      if client and client:supports_method('textDocument/foldingRange') then
        local win = vim.api.nvim_get_current_win()
        vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
      end
    end,
  })
end
