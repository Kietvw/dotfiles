return {
	"mason-org/mason-lspconfig.nvim",
	version = "v2.0.x",
	dependencies = {
		{
			"mason-org/mason.nvim",
			version = "v2.0.x",
			opts = {},
		},
	},
	build = ":MasonUpdate",
	opts = {
		automatic_enable = false,
		ensure_installed = {
			"lua_ls",
			"intelephense",
			"ts_ls",
			"vtsls",
			"vue_ls",
		},
	},
}
