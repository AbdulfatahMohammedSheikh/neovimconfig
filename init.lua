require('user.core')
require('user.lazy')
require('user.snippets')

-- vim.cmd('colorscheme nightfly')
vim.cmd.colorscheme 'midnight'
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Hightlight yanked test",
    group = vim.api.nvim_create_augroup("Yanked test", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
