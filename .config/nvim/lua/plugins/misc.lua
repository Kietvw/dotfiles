-- Standalone plugins with less than 10 lines of config go here
return {
	{ -- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{ -- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{ -- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{ -- Surround selection
		"tpope/vim-surround",
	},
	{ -- Hints keybinds
		"folke/which-key.nvim",
	},
	{ -- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ -- Quick searches
		"justinmk/vim-sneak",
	},
	{ -- Documentation blocks
		"kkoomen/vim-doge",

		config = function()
			vim.g.doge_javascript_settings = {
				destructuring_props = 1,
				omit_redundant_param_types = 1,
			}
		end,
	},
	{ -- Show CSS Colors
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
}
