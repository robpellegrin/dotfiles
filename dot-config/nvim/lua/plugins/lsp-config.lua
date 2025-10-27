-- lsp-config.lua
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "pylsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Enable the servers
      vim.lsp.enable('lua_ls', {
        capabilities = capabilities,
      })

      vim.lsp.enable('bashls', {
        capabilities = capabilities,
      })

      vim.lsp.enable('clangd', {
        capabilities = capabilities,
      })

      vim.lsp.enable('rust_analyzer', {
        capabilities = capabilities,
      })

      vim.lsp.enable('pylsp', {
        capabilities = capabilities,
      })

      -- Key bindings
      vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,

  },
}
