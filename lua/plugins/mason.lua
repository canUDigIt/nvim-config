return {
  {
    "williamboman/mason.nvim",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "ols",
        "basedpyright",
        "html",
        "cssls",
        "ts_ls",
        "emmet_ls",
      }
    }
  },
  "neovim/nvim-lspconfig"
}
