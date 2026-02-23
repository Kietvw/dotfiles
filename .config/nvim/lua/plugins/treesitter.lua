require("nvim-treesitter").install({ "vue" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"vue",
		"json",
		"typescript",
		"javascript",
		"html",
		"css",
		"markdown",
		"php",
	},
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
		-- folds, provided by Neovim
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo.foldmethod = "expr"
		-- indentation, provided by nvim-treesitter
		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
