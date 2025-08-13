return {
	"mason-org/mason-lspconfig.nvim",
	version = "v2.1.x",
	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				---@type string[]
				ensure_installed = {
					"lua_ls",
					"stylua",

					"ts_ls",
					"vtsls",
					"vue_ls",
					"prettierd",

					"intelephense",
					"phpstan",
					"phpcs",

					"xmlformatter",
				},
			},
		},
		{
			"mason-org/mason.nvim",
			version = "v2.0.x",
			opts = {},
		},
	},
	build = ":MasonUpdate",
	opts = {
		automatic_enable = {
			"prettierd",
			"phpstan",
			"phpcs",
			"stylua",
		},
	},
}
