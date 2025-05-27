return {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    config = function ()
        require('cyberdream').setup({
            colors = {
                bg = "#000000"
            },
        })

        require('lualine').setup({
            theme = "auto"
        })

        vim.cmd('colorscheme cyberdream')
    end
}

