return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "cpp", "cmake", "lua", "markdown", "markdown_inline", "odin", "python", "rust", "typescript", "vim", "zig" },
        highlight = {
          enable = true,
        },
      }
    end,
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    build = ':TSUpdate',
  },
}
