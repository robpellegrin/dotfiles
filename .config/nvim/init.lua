-- LAZY SETUP --
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader before lazy.nvim is loaded chickn
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup("plugins")

-- Key mappings
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>:q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-X>", ":qa!<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "D", "dd", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>t", ":FloatermToggle<CR>", { noremap = true })

-- Enable line numbers
vim.cmd("set number")

-- Set tabs configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Remove '~' on empty lines
vim.opt.fillchars = "eob: " -- Set the 'eob' (end-of-buffer) fill character to a space

-- Cursor blink
vim.opt.guicursor = "a:blinkon1"

-- Enable spell checking
vim.opt.spell = true

-- Set languages for spell checking
vim.opt.spelllang = { "en_us" }
