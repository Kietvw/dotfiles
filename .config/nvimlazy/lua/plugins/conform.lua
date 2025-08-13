return {
	"stevearc/conform.nvim",
	version = "v9.0.x",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>a",
			function()
				require("conform").format({ async = true }, function(err, did_edit)
					if not err and did_edit then
						vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	---@module 'conform.nvim'
	---@type conform.setupOpts
	opts = {
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

			xml = { "xmlformatter" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
