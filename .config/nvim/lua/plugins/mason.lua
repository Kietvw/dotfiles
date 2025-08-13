vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"stylua",

		"prettierd",
		"typescript-language-server",
		"vue-language-server",
		"vtsls",

		"intelephense",
		"phpcs",
		"phpstan",
	},
})

require("mason").setup()
