return {
    'Lilja/zellij.nvim',

    config = function()
        require('zellij').setup({
            debug = false, -- Will log things to /tmp/zellij.nvim
        })

        vim.keymap.set('n', 'zh', ':ZellijNavigateLeft<CR>')
        vim.keymap.set('n', 'zl', ':ZellijNavigateRight<CR>')
        vim.keymap.set('n', 'zj', ':ZellijNavigateDown<CR>')
        vim.keymap.set('n', 'zk', ':ZellijNavigateUp<CR>')

        vim.keymap.set('n', 'zp', ':ZellijNewPane<CR>')
        vim.keymap.set('n', 'zrp', ':ZellijRenamePane<CR>')

        vim.keymap.set('n', 'zt', ':ZellijNewTab<CR>')
        vim.keymap.set('n', 'zrt', ':ZellijRenameTab<CR>')

    end
}
