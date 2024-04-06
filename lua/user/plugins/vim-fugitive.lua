return {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
        vim.keymap.set('n', '<leader>g', ':G ')
    end
}
