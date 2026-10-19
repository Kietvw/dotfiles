local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Save file & exit insert mode
vim.keymap.set({ "n", "i" }, "<C-s>", function()
	vim.cmd("stopinsert")
	vim.cmd("w")
end, opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set({ "n", "v" }, "K", "5k")
vim.keymap.set({ "n", "v" }, "J", "5j")

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", function()
	local buffer = vim.api.nvim_get_current_buf()
	-- Prefer the alternate (last visited) buffer, fall back to list order
	local alternate = vim.fn.bufnr("#")
	if alternate > 0 and alternate ~= buffer and vim.bo[alternate].buflisted then
		vim.cmd("buffer #")
	else
		vim.cmd("bprevious")
	end
	local previousbuffer = vim.api.nvim_get_current_buf()

	if buffer == previousbuffer then
		vim.cmd("enew")
		local newbuffer = vim.api.nvim_get_current_buf()

		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == buffer then
				vim.api.nvim_win_set_buf(win, newbuffer)
			end
		end
	end

	vim.api.nvim_buf_delete(buffer, {})
end, opts)
vim.keymap.set("n", "<leader>X", function()
	local buffers = vim.tbl_filter(function(b)
		return vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted
	end, vim.api.nvim_list_bufs())
	local current_buffer = vim.api.nvim_get_current_buf()

	for _, buffer in ipairs(buffers) do
		-- Skip buffers with unsaved changes
		if buffer ~= current_buffer and not vim.bo[buffer].modified then
			vim.api.nvim_buf_delete(buffer, {})
		end
	end
end, { desc = "Close other buffers" })

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>w", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP keymaps
-- Built-in defaults: grn rename, gra code action, grr references, gri implementation, grt type definition
-- vim.keymap.set('n', '<leader>a', vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbol" })
vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
