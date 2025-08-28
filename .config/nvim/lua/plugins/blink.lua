vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.6") },
})

require("blink.cmp").setup({
	completion = {
		list = {
			selection = {
				auto_insert = false,
				preselect = false,
			},
		},
		documentation = {
			auto_show = true,
		},
		menu = {
			draw = {
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "kind" },
					{ "source_name" },
				},
			},
		},
	},
	keymap = {
		preset = "none",
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-h>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "scroll_documentation_down", "fallback" },
		-- ["<Tab>"] = {
		-- 	--- Accept selection, else select first option.
		-- 	function(cmp)
		-- 		if cmp.is_visible() then
		-- 			local entry = cmp.get_selected_item()
		-- 			cmp.show_signature()
		--
		-- 			if not entry then
		-- 				return cmp.select_and_accept()
		-- 			else
		-- 				return cmp.accept()
		-- 			end
		-- 		end
		-- 	end,
		-- 	"fallback",
		-- },
		["<CR>"] = {
			--- Accept selected entry, else insert new line.
			function(cmp)
				if cmp.is_menu_visible() and cmp.get_selected_item() then
					cmp.show_signature()
					return cmp.accept()
				end
			end,
			"fallback",
		},
	},
	signature = { enabled = true },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})
