return {
	"romgrk/barbar.nvim",
	version = "v1.9.x",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("barbar").setup({
			animation = false,
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Move to previous/next
		map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
		map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)

		-- Goto buffer in position...
		map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

		-- Close buffer
		map("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)
	end,
}
