vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettierd" },
		typescript = { "prettierd" },
		vue = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		markdown = { "prettierd" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>a", function()
	conform.format({ async = true })
end)
