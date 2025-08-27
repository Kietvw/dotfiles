vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim", version = vim.version.range("2.15") },
})

local actions = require("oil.actions")

require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-h>"] = false,
		["<C-j>"] = false,
		["<C-k>"] = false,
		["<C-l>"] = false,
		["<leader>po"] = actions.open_terminal,
		["<leader>e"] = actions.refresh,
	},
})

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true })
