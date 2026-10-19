-- lspconfig's handler gives up after ~1s (and never resets its retry counter),
-- but vtsls takes longer than that to start on Windows. Wait up to 10s per request.
local config = {
	on_init = function(client)
		client.handlers["tsserver/request"] = function(_, result, context)
			local function forward(attempt)
				local ts_client = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })[1]

				if not ts_client then
					if attempt < 100 then
						vim.defer_fn(function()
							forward(attempt + 1)
						end, 100)
					else
						vim.notify("Could not find `vtsls` lsp client required by `vue_ls`.", vim.log.levels.ERROR)
					end
					return
				end

				local id, command, payload = unpack(unpack(result))
				ts_client:exec_cmd({
					title = "vue_request_forward",
					command = "typescript.tsserverRequest",
					arguments = { command, payload },
				}, { bufnr = context.bufnr }, function(_, r)
					client:notify("tsserver/response", { { id, r and r.body } })
				end)
			end

			forward(0)
		end
	end,
}

-- nvim-lspconfig's lsp/vue_ls.lua comes later in runtimepath and would override
-- on_init, so register explicitly (vim.lsp.config() always wins)
vim.lsp.config("vue_ls", config)

return config
