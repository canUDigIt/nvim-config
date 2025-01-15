return {
  cmd = { 'ols' },
  root_dir = function (cb)
    local root = vim.fs.root(0, { 'ols.json', '.git' })
    if root == nil then
      root = vim.fs.root(0, function(name, _)
        return vim.endswith(name, '.odin')
      end)
    end
    if root == nil then
      root = '.'
    end
    cb(root)
  end,
  filetypes = { 'odin' },
  settings = {
    enable_format = true,
    enable_hover = true,
    enable_snippets = true,
    enable_semantic_tokens = true,
    enable_document_symbols = true,
    enable_fake_methods = true,
    enable_procedure_snippet = true,
    enable_references = true,
    enable_rename = true,
  }
}
