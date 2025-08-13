local opts = { noremap = true, silent = true }

vim.keymap.set('n', "<leader>o", ':update<CR> :source<CR>')

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

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

-- Faster vertical movement with shift
vim.keymap.set("n", "K", "5k")
vim.keymap.set("n", "J", "5j")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x',
    function()
        local buffer = vim.api.nvim_get_current_buf()
        vim.cmd('bprevious')
        local previousbuffer = vim.api.nvim_get_current_buf()

        if buffer == previousbuffer then
            vim.cmd('enew')
            local newbuffer = vim.api.nvim_get_current_buf()

            for _, win in ipairs(vim.api.nvim_list_wins()) do
                if vim.api.nvim_win_get_buf(win) == buffer then
                    vim.api.nvim_win_set_buf(win, newbuffer)
                end
            end
        end

        vim.cmd('bdelete' .. buffer)
    end, opts
)


-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)     -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)     -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)    -- make split windows equal width & height
vim.keymap.set("n", "<leader>w", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)     --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d",
    function() vim.diagnostic.jump({ count = -1, float = true }) end,
    { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d",
    function() vim.diagnostic.jump({ count = 1, float = true }) end,
    { desc = "Go to next diagnostic message" }
)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP keymaps
-- vim.keymap.set('n', '<leader>a', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbol" })
vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
