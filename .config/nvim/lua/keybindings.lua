-- This file contains only custom keybindings for neovim.

--- Normal mode mappings
vim.api.nvim_set_keymap("n", "J", ":m +1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "U", ":m -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-X>", ":qa!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", "dd", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":FloatermToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "0", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "-", "g_", { noremap = true })

--- Insert mode mappings
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>:q<CR>", { noremap = true, silent = true })

--- Visual mode mappings
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "0", "^", { noremap = true })
vim.api.nvim_set_keymap("v", "-", "g_", { noremap = true })
