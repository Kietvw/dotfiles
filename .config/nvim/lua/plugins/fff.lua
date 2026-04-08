vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		if event.data.updated then
			require("fff.download").download_or_build_binary()
		end
	end,
})

vim.g.fff = {
	lazy_sync = true,
	debug = {
		enabled = false,
		show_scores = false,
	},
}

local fff = require("fff")

vim.keymap.set("n", "<leader>sf", fff.find_files, { desc = "FFFind files" })
vim.keymap.set("n", "<leader>sg", fff.live_grep, { desc = "LiFFFe grep" })
vim.keymap.set("n", "<leader>sw", function()
	fff.live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "LiFFFe current word" })
vim.keymap.set("n", "<leader>sc", function()
	fff.find_files_in_dir("~/dotfiles")
end, { desc = "FFFind in dotfiles" })

require("fff").setup({
	keymaps = {
		move_up = { "<Up>", "<C-k>" },
		move_down = { "<Down>", "<C-j>" },
	},
})
