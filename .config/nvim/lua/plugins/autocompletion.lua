return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			{
				path = "${3rd}/luv/library",
				words = { "vim%.uv" },
			},
		},
	},
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = {
				preset = "default",
				["<C-j>"] = { "show_and_insert", "select_next" },
				["<C-k>"] = { "show_and_insert", "select_prev" },
				["<C-CR>"] = { "select_and_accept" },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = {
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			fuzzy = { implementation = "lua" },

			signature = { enabled = true },
		},
	},
}
