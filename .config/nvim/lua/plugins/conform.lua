local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		angular = { "prettierd" },
		css = { "prettierd" },
		flow = { "prettierd" },
		graphql = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		jsx = { "prettierd" },
		javascript = { "prettierd" },
		less = { "prettierd" },
		markdown = { "prettierd" },
		scss = { "prettierd" },
		typescript = { "prettierd" },
		vue = { "prettierd" },
		yaml = { "prettierd" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>a", function()
	conform.format({ async = true })
end)
