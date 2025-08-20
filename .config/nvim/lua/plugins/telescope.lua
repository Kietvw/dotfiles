vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v1.0.8" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzy-native.nvim" },
})

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})
telescope.load_extension("fzy_native")

vim.keymap.set("n", "<leader>sf", builtin.find_files)
vim.keymap.set("n", "<leader>sg", builtin.live_grep)
vim.keymap.set("n", "<leader>sw", builtin.grep_string)
vim.keymap.set("n", "<leader><leader>", builtin.buffers)
vim.keymap.set("n", "<leader>st", builtin.tags)
vim.keymap.set("n", "<leader>sq", builtin.quickfix)
vim.keymap.set("n", "<leader>sm", builtin.marks)
vim.keymap.set("n", "<leader>sc", function()
	builtin.find_files({ search_dirs = { "~/dotfiles/.config/nvim" } })
end)
vim.keymap.set("n", "<leader>sp", function()
	builtin.find_files({
		search_dirs = { "~/source/" },
		file_ignore_patterns = { "node_modules" },
	})
end)
