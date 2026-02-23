local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		angular = { "prettier" },
		css = { "prettier" },
		flow = { "prettier" },
		graphql = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		jsx = { "prettier" },
		javascript = { "prettier" },
		less = { "prettier" },
		markdown = { "prettier" },
		scss = { "prettier" },
		typescript = { "prettier" },
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
