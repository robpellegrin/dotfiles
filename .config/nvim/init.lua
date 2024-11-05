-- LAZY SETUP --
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader before lazy.nvim is loaded
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = require("plugins"),  -- Load plugins from the plugins.lua file

  -- Configure any other settings here. See the documentation for more details.
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
-- vim.cmd.colorscheme "github_dark_default"
-- END LAZY SETUP --

-- Additional configuration, mappings, and settings

-- Neotree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- Treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "c", "cpp", "vim", "python", "lua", "java", "rust" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

-- Key mappings
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>:q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":q<CR>", { noremap = true, silent = true })

-- Enable line numbers
vim.cmd("set number")

-- Set tabs configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Remove '~' on empty lines
vim.opt.fillchars = "eob: "  -- Set the 'eob' (end-of-buffer) fill character to a space
