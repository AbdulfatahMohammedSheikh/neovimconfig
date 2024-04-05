return {
    "declancm/maximize.nvim",
    config = function()
        require('maximize').setup({
            default_keymaps = false
        })
        vim.keymap.set('n', 'si', "<Cmd>lua require('maximize').toggle()<CR>")
    end
}
