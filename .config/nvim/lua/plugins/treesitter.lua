return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autostage = { enable = true },
			ensure_installed = {
				"lua",
				"typescript",
				"vue",
				"vim",
				"html",
				"javascript",
				"json",
				"css",
				"scss",
				"php",
			},
			auto_install = false,
		})
	end,
}
