-- Neotree.lua
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Not required but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window
		},
		config = function()
			-- Set the keymap to toggle Neotree with <C-n>
			vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", { noremap = true, silent = true })
		end,
	},
}
