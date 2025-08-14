local blink = require("blink.cmp")

return {
	cmd = { "phpactor", "language-server" },
	filetypes = { "php" },
	root_markers = {
		".git",
		"composer.json",
		".phpactor.json",
		".phpactor.yml",
	},
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		blink.get_lsp_capabilities()
	),
}
