vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
	autostage = { enable = true },
	sync_install = false,
	auto_install = false,
	modules = {},
	ignore_install = {},
	ensure_installed = {
		"lua",
		"vue",
		"typescript",
		"javascript",
		"html",
		"json",
		"scss",
		"css",
		"php",
	},
})
