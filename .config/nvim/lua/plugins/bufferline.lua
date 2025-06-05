return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("barbar").setup({
			animation = false;
		})
	end,
}
