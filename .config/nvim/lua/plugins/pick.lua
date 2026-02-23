require("mini.pick").setup({
	mappings = {
		move_down = "<C-j>",
		move_up = "<C-k>",
	},
})

vim.keymap.set("n", "<leader>sf", MiniPick.builtin.files)
vim.keymap.set("n", "<leader>sg", MiniPick.builtin.grep_live)
vim.keymap.set("n", "<leader><leader>", MiniPick.builtin.buffers)
