local vue_language_server_path = vim.fn.expand("~") .. "/scoop/persist/nodejs-lts/bin/node_modules/@vue/language-server"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	confignamespace = "typescript",
}
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = { vue_plugin },
			},
		},
	},
	filetypes = tsserver_filetypes,
}
local ts_ls_config = {
	init_options = {
		plugins = { vue_plugin },
	},
	filetypes = tsserver_filetypes,
}
local vue_ls_config = {
	settings = {
		vue = {
			suggest = {
				propNameCasing = "preferKebabCase",
				componentNameCasing = "preferKebabCase",
			},
		},
	},
}

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)

vim.lsp.enable({
	"lua_ls",
	-- "vtsls",
	"ts_ls",
	"vue_ls",
	-- "phpactor",
	"intelephense",
	-- "phptools",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed

		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
