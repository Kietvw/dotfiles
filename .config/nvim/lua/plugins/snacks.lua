return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		git = { enabled = true },
		image = { enabled = true },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		layout = { enabled = true },
		lazygit = { enabled = true },
		-- notifier = {enabled = true }
		picker = {
			enabled = true,
			sources = {
				files = { hidden = true },
				grep = { hidden = true },
			},
		},
		scope = { enabled = true },
		terminal = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		{
			"<leader>po",
			function()
				Snacks.terminal.open()
			end,
			desc = "Open new terminal",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>x",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete current buffer",
		},
		{
			"<leader>X",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete other buffers",
		},
		{
			"<leader>xx",
			function()
				Snacks.bufdelete.all()
			end,
			desc = "Delete all buffers",
		},
		-- Top Pickers & Explorer
		{
			"<leader>sf",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},

		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- LSP
		{
			"gd",
			--- Jump to the definition of the word under your cursor.
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "[G]oto [D]efinition",
		},
		{
			"gD",
			--- Jump to the declarations of the word under your cursor.
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "[G]oto [D]eclaration",
		},
		{
			"gr",
			--- Jump to the references of the word under your cursor.
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "[G]oto [R]eferences",
		},
		{
			"gI",
			--- Jump to the implementations of the word under your cursor.
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "[G]oto [I]mplementation",
		},
		{
			"gy",
			--- Jump to the type definition of the word under your cursor.
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "[G]oto T[y]pe Definition",
		},
		{
			"<leader>ss",
			--- Fuzzy find all the symbols in your current document.
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			--- Fuzzy find all the symbols in your current project.
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
