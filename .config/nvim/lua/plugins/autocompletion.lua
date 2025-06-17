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
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
				opts = {},
			},
		},
		opts = {
			keymap = {
				-- 'default' | 'super-tab' | 'enter' | 'none'
				preset = "enter",
				["<C-j>"] = { "show_and_insert", "select_next" },
				["<C-k>"] = { "show_and_insert", "select_prev" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				menu = {
					draw = {
						columns = {
							{
								"kind_icon",
								"label",
								"label_description",
								"source_name",
								gap = 1,
							},
							components = {
								label_description = {
									width = { max = 50 },
								},
								source_name = {
									text = function(ctx)
										return "[" .. ctx.source_name .. "]"
									end,
								},
							},
						},
					},
				},
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},

			sources = {
				default = { "lsp", "lazydev", "path", "snippets", "buffer" },
				providers = {
					lsp = { score_offset = 1000 },
					buffer = { score_offset = 800 },
					path = { score_offset = 800 },
					snippets = { score_offset = 900 },
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			snippets = { preset = "luasnip" },

			fuzzy = { implementation = "lua" },

			signature = { enabled = true },
		},
	},
}
