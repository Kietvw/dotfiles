require("config.options")
require("config.keymaps")
require("core.lsp")

vim.pack.add({
	-- theme
	{ src = "https://github.com/scottmckendry/cyberdream.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- lazygit (version control)
	{ src = "https://github.com/kdheepak/lazygit.nvim" },

	-- lsp and stuff
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim", version = vim.version.range("2.1") },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- telescope (file searching)
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("0.1") },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzy-native.nvim" },

	-- code assist
	{ src = "https://github.com/stevearc/conform.nvim", version = vim.version.range("9.1") },
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.8") },
	{ src = "https://github.com/mfussenegger/nvim-lint" },

	-- file tree
	{ src = "https://github.com/stevearc/oil.nvim" },

	-- buffer & status
	{ src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("4.9") },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- misc
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/justinmk/vim-sneak", version = vim.version.range("1.11") },
	{ src = "https://github.com/echasnovski/mini.pairs" },
})

require("plugins.theme")
require("plugins.lazygit")
require("plugins.oil")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.conform")
require("plugins.blink")
require("plugins.lint")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.mason")
require("mini.pairs").setup()
