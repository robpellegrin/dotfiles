-- alpha-nvim.lua
return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    -- ASCII logo with "NEOVIM"
    dashboard.section.header.val = {
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      [[                                                   ]],
      [[                Welcome to Neovim                  ]],
    }

    -- Custom buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "🕓  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "🚪  Quit", ":qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = {
      "",
    }

    -- Highlight for the header (blue color)
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#61afef", ctermfg = 74 }) -- Blue color

    -- Apply highlights
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Type"

    -- Apply the configuration
    require("alpha").setup(dashboard.opts)
  end,
}
