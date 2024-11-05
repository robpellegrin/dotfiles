-- Lazy setup --
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    {'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }}
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
vim.cmd.colorscheme "github_dark_default"
-- END LAZY SETUP --

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

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

