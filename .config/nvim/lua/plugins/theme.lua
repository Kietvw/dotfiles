vim.pack.add({
	{ src = "https://github.com/scottmckendry/cyberdream.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

--- cyberdream colors
local _cyberdream = {
	bg = "#000000", -- #16181a
	bg_alt = "#1e2124", -- #1e2124
	bg_highlight = "#3c4048", -- #3c4048
	fg = "#ffffff", -- #ffffff
	grey = "#7b8496", -- #7b8496
	blue = "#569cd6", -- #5ea1ff
	green = "#7ca668", -- #5eff6c
	cyan = "#5ec9b0", -- #5ef1ff
	red = "#ff6e5e", -- #ff6e5e
	yellow = "#ffd700", -- #f1ff5e
	magenta = "#ff5ef1", -- #ff5ef1
	pink = "#ff5ea0", -- #ff5ea0
	orange = "#ce9178", -- #ffbd5e
	purple = "#c586c0", -- #bd5eff
}
--- custom colors
local custom_colors = {
	white = "#ffffff",
	lightgrey = "#d4d4d4",
	lightyellow = "#dcdcaa",
	lightblue = "#9cdcfe",
	lightgreen = "#b5cea8",
	matrix = "#00ff41",
}

require("cyberdream").setup({
	-- Override colors
	colors = _cyberdream,

	overrides = function(colors)
		-- VSCode like theme.
		return {
			Comment = { fg = colors.green, bg = "NONE", italic = false },
			Type = { fg = colors.cyan },
			Identifier = { fg = custom_colors.lightblue },
			["@boolean"] = { fg = colors.blue },
			["@constructor"] = { fg = colors.cyan },
			["@constant"] = { fg = custom_colors.white },
			["@constant.scss"] = { fg = custom_colors.lightyellow },
			["@constant.builtin"] = { fg = colors.blue },
			["@function"] = { fg = custom_colors.lightyellow },
			["@function.call"] = { fg = custom_colors.lightyellow },
			["@property.scss"] = { fg = custom_colors.lightgrey },
			["@punctuation.bracket"] = { fg = colors.yellow },
			["@punctuation.bracket.alt"] = { fg = colors.red },
			["@punctuation.special"] = { fg = colors.blue },
			["@punctuation.special.vue"] = { fg = custom_colors.white },
			["@keyword"] = { fg = colors.blue },
			["@keyword.exception"] = { fg = colors.purple },
			["@keyword.function"] = { fg = colors.blue },
			["@keyword.import"] = { fg = colors.purple },
			["@keyword.import.php"] = { fg = colors.blue },
			["@keyword.return"] = { fg = colors.purple },
			["@keyword.conditional"] = { fg = colors.purple },
			["@keyword.conditional.ternary"] = { fg = custom_colors.white },
			["@keyword.repeat"] = { fg = colors.purple },
			["@keyword.type"] = { fg = colors.blue },
			["@keyword.modifier"] = { fg = colors.blue },
			["@keyword.coroutine"] = { fg = colors.purple },
			["@tag"] = { fg = colors.blue },
			["@tag.scss"] = { fg = custom_colors.lightyellow },
			["@tag.delimiter"] = { fg = colors.grey },
			["@type.builtin"] = { fg = colors.cyan },
			["@type.builtin.php"] = { fg = colors.blue },
			["@type.scss"] = { fg = custom_colors.lightyellow },
			["@operator"] = { fg = custom_colors.white },
			["@module"] = { fg = colors.cyan },
			["@number"] = { fg = custom_colors.lightgreen },
			["@number.float"] = { fg = custom_colors.lightgreen },
			["@string"] = { fg = colors.orange },
			["@string.regexp"] = { fg = colors.red },
			["@string.escape"] = { fg = colors.blue },
			["@string.scss"] = { fg = colors.orange },
			["@variable"] = { fg = custom_colors.lightblue },
			["@variable.scss"] = { fg = custom_colors.lightgrey },
			["@variable.parameter.scss"] = { fg = custom_colors.lightgrey },
			["@variable.builtin"] = { fg = colors.blue },
			["@variable.member"] = { fg = custom_colors.lightblue },
			["@variable.parameter.php"] = { fg = custom_colors.white },
		}
	end,
})

vim.cmd("colorscheme cyberdream")
