-- Treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true, -- auto add new languages.
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
