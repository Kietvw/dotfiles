-- <leader><leader> → Open a nice buffer selector
vim.keymap.set("n", "<leader><leader>", function()
	local buffers = {}
	local current_buf = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			local name = vim.api.nvim_buf_get_name(buf)
			local display = name ~= "" and vim.fn.fnamemodify(name, ":~:.") or "[No Name]"

			-- Add buffer number and a marker for current buffer
			if buf == current_buf then
				display = "* " .. display
			else
				display = "  " .. display
			end

			table.insert(buffers, {
				buf = buf,
				display = display,
				name = name,
			})
		end
	end

	-- Sort by most recently used (optional but nice)
	table.sort(buffers, function(a, b)
		return vim.fn.getbufinfo(a.buf)[1].lastused > vim.fn.getbufinfo(b.buf)[1].lastused
	end)

	vim.ui.select(buffers, {
		prompt = "Select buffer:",
		format_item = function(item)
			return item.display
		end,
	}, function(choice)
		if choice then
			vim.api.nvim_set_current_buf(choice.buf)
		end
	end)
end, { desc = "Switch buffer" })
