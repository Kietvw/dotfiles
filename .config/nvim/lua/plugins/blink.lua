return {
	{
		"folke/lazydev.nvim",
		version = "v1.9.x",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"Saghen/blink.cmp",
		version = "v1.5.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			completion = {
				list = {
					selection = {
						auto_insert = false,
						preselect = false,
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
					},
				},
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
			},
			keymap = {
				preset = "none",
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-h>"] = { "scroll_documentation_up", "fallback" },
				["<C-l>"] = { "scroll_documentation_down", "fallback" },
				["<Tab>"] = {
					--- Accept selection, else select first option.
					function(cmp)
						if cmp.is_visible() then
							local entry = cmp.get_selected_item()

							if not entry then
								return cmp.select_and_accept()
							else
								return cmp.accept()
							end
						end
					end,
					"fallback",
				},
				["<CR>"] = {
					--- Accept selected entry, else insert new line.
					function(cmp)
						if cmp.is_menu_visible() and cmp.get_selected_item() then
							return cmp.accept()
						end
					end,
					"fallback",
				},
			},
			signature = { enabled = true },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
		opts_extend = { "sources.default" },
	},
}
