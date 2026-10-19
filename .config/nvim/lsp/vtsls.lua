local vue_path = vim.fn.stdpath("cache") .. "/vue_language_server_path"

if not vim.uv.fs_stat(vue_path) then
	local npm_root = vim.fn.trim(vim.fn.system("npm root -g"))
	-- Only cache a successful result, otherwise a failed lookup sticks forever
	if vim.v.shell_error == 0 then
		vim.fn.writefile({ npm_root }, vue_path)
	end
end

local npm_root = vim.uv.fs_stat(vue_path) and vim.fn.readfile(vue_path)[1] or ""
local vue_language_server_path = npm_root .. "/@vue/language-server"

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

local config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- nvim-lspconfig's lsp/vtsls.lua comes later in runtimepath and would override
-- these filetypes, so register explicitly (vim.lsp.config() always wins)
vim.lsp.config("vtsls", config)

return config
