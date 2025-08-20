vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim", version = vim.version.range("2.15") },
})

require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true })
