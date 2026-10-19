local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		css = { "prettier" },
		graphql = { "prettier" },
		html = { "prettier" },
		htmlangular = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		less = { "prettier" },
		markdown = { "prettier" },
		scss = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		vue = { "prettier" },
		yaml = { "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>a", function()
	conform.format({ async = true })
end)
