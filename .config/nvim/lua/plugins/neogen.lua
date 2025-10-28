-- neogen.lua

return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      snippet_engine = "luasnip",
      enabled = true,
      languages = {
        c = {
          template = {
            kind = "doxygen", -- Set the template style to 'doxygen'
          },
        },
        cpp = {
          template = {
            kind = "doxygen", -- Doxygen template for C++
          },
        },
        -- Add other language configurations as needed
      },
    })
  end,
  --  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
