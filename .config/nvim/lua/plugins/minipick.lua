vim.pack.add({
    { src = "https://github.com/echasnovski/mini.pick" }
})

require('mini.pick').setup({
    mappings = {
        move_down      = '<C-j>',
        move_up        = '<C-k>',
        toggle_preview = "<C-p>"
    },
})

vim.keymap.set('n', '<leader>sf', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>sr', MiniPick.builtin.resume)
vim.keymap.set('n', '<leader><leader>', MiniPick.builtin.buffers)
