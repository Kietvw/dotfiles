return {
	"stevearc/oil.nvim",
	version = "2.15.x",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
	keymaps = {
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
	},
}
