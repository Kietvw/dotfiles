return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			-- Set light or dark variant
			variant = "default",

			-- Enable transparent background
			transparent = false,

			-- Reduce the overall saturation of colours for a more muted look
			saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

			-- Enable italics comments
			italic_comments = false,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,

			-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
			borderless_pickers = false,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
			cache = false,

			overrides = function(colors)
				return {
					Comment = { fg = colors.green, bg = "NONE", italic = false },
					Type = { fg = colors.cyan },
					Identifier = { fg = "#a2ddfc" },
					["@boolean"] = { fg = colors.blue },
					["@constructor"] = { fg = colors.cyan },
					["@constant"] = { fg = colors.white },
					["@constant.builtin"] = { fg = colors.blue },
					["@function"] = { fg = "#dcdbad" },
					["@function.call"] = { fg = "#dcdbad" },
					["@punctuation.bracket"] = { fg = colors.yellow },
					["@punctuation.bracket.alt"] = { fg = colors.red },
					["@punctuation.special"] = { fg = colors.blue },
					["@punctuation.special.vue"] = { fg = colors.white },
					["@keyword"] = { fg = colors.blue },
					["@keyword.exception"] = { fg = colors.purple },
					["@keyword.function"] = { fg = colors.blue },
					["@keyword.import"] = { fg = colors.purple },
					["@keyword.import.php"] = { fg = colors.blue },
					["@keyword.return"] = { fg = colors.purple },
					["@keyword.conditional"] = { fg = colors.purple },
					["@keyword.conditional.ternary"] = { fg = colors.white },
					["@keyword.repeat"] = { fg = colors.purple },
					["@keyword.type"] = { fg = colors.blue },
					["@keyword.modifier"] = { fg = colors.blue },
					["@keyword.coroutine"] = { fg = colors.purple },
					["@tag"] = { fg = colors.blue },
					["@tag.delimeter"] = { fg = colors.grey },
					["@type.builtin"] = { fg = colors.cyan },
					["@type.builtin.php"] = { fg = colors.blue },
					["@operator"] = { fg = colors.white },
					["@module"] = { fg = colors.cyan },
					["@number"] = { fg = colors.green },
					["@string"] = { fg = colors.orange },
					["@string.regexp"] = { fg = colors.red },
					["@string.escape"] = { fg = colors.blue },
					["@variable"] = { fg = "#a2ddfc" },
					["@variable.builtin"] = { fg = colors.blue },
					["@variable.member"] = { fg = "#a2ddfc" },
					["@variable.parameter.php"] = { fg = colors.white },
				}
			end,

			-- Override colors
			colors = {
				bg = "#000000", -- #16181a
				bg_alt = "#1e2124", -- #1e2124
				bg_highlight = "#3c4048", -- #3c4048
				fg = "#ffffff", -- #ffffff
				grey = "#7b8496", -- #7b8496
				blue = "#5e9ed3", -- #5ea1ff
				green = "#7fa56b", -- #5eff6c
				cyan = "#5ec9b0", -- #5ef1ff
				red = "#ff6e5e", -- #ff6e5e
				yellow = "#fcd534", -- #f1ff5e
				magenta = "#ff5ef1", -- #ff5ef1
				pink = "#ff5ea0", -- #ff5ea0
				orange = "#ca907a", -- #ffbd5e
				purple = "#d572d3", -- #bd5eff
			},

			-- Disable or enable colorscheme extensions
			extensions = {
				telescope = false,
			},
		})

		require("lualine").setup({
			theme = "auto",
		})

		vim.cmd("colorscheme cyberdream")
	end,
}
