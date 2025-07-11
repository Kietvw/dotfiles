-- Standalone plugins with less than 10 lines of config go here
return {
	{ -- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{ -- Surround selection
		"tpope/vim-surround",
	},
	{ -- Hints keybinds
		"folke/which-key.nvim",
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ -- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{ -- Quick searches
		"justinmk/vim-sneak",
	},
	{ -- Show CSS Colors
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
}
