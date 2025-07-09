return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		-- "neovim/nvim-lspconfig",
	},
	build = ":MasonUpdate",
	opts = {
		automatic_enable = false,
		ensure_installed = {
			"lua_ls",
            "intelephense",
            "ts_ls",
            "vue_ls",
		},
	},
}
