vim.lsp.config("phptools", {
	cmd = { "devsense-php-ls", "--stdio" },
	filetypes = { "php" },
	root_markers = {
		"composer.json",
		".git",
	},
	init_options = {
		-- Optional premium license
		["0"] = "{}",
	},
})
