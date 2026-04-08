require("config.options")
require("config.keymaps")
require("core.lsp")

vim.pack.add({
	-- Theme
	{ src = "https://github.com/scottmckendry/cyberdream.nvim", version = vim.version.range("5.3") },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- Lsp
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig", version = vim.version.range("2.7") },

	-- Files
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/dmtrKovalenko/fff.nvim" },

	-- Code assist
	{ src = "https://github.com/stevearc/conform.nvim", version = vim.version.range("9.1") },
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.10") },
	{ src = "https://github.com/mfussenegger/nvim-lint" },

	-- Buffer & status
	{ src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("4.9") },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- Misc
	{ src = "https://github.com/lewis6991/gitsigns.nvim", version = vim.version.range("2.1") },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/justinmk/vim-sneak", version = vim.version.range("1.11") },
	{ src = "https://github.com/echasnovski/mini.pairs" },
	{ src = "https://github.com/folke/zen-mode.nvim", version = vim.version.range("1.4") },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", version = vim.version.range("8.12") },
})

require("plugins.blink")
require("plugins.conform")
require("plugins.fff")
require("plugins.lint")
require("plugins.oil")
-- require("plugins.pick")
require("plugins.treesitter")
require("plugins.theme")
require("bufferline").setup()
require("lualine").setup({})
require("mini.pairs").setup()
require("zen-mode")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
