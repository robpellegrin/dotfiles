-- Treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({auto_install = true,})
  end
 }

--return {
--  {
--    "nvim-treesitter/nvim-treesitter",
--    build = ":TSUpdate",
--
--    config = function()
--      local configs = require("nvim-treesitter.configs")
--      config.setup({
--        auto_install = true, -- auto add new languages.
--        sync_install = false,
--        highlight = { enable = true },
--        indent = { enable = true },
--      })
--    end,
--  },
--}
