local vue_path = vim.fn.stdpath("cache") .. "/vue_language_server_path"

if not vim.uv.fs_stat(vue_path) then
	local npm_root = vim.fn.trim(vim.fn.system("npm root -g"))
	vim.fn.writefile({ npm_root }, vue_path)
end

local npm_root = vim.fn.readfile(vue_path)[1]
local vue_language_server_path = npm_root .. "/@vue/language-server"

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
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

vim.lsp.config("vtsls", config)

return config
