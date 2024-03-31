return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
      "nvim-neorg/neorg",
      opts = {
          load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.dirman"] = { -- Manages Neorg workspaces
                  config = {
                      workspaces = {
                          notes = "~/notes",
                      },
                  },
              },
          },
      },
      lazy = false,
      version = "*",
      dependencies = { "luarocks.nvim" },
  }
}
