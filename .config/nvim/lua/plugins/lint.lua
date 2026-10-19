require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	vue = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("my.lint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})
