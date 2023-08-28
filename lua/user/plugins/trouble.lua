return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        -- TODO: remove the unnessary remaps
        vim.keymap.set("n", "<leader>qq", function() require("trouble").open() end)
        vim.keymap.set("n", "<leader>qw", function() require("trouble").open("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>qd", function() require("trouble").open("document_diagnostics") end)
        vim.keymap.set("n", "<leader>qf", function() require("trouble").open("quickfix") end)
        vim.keymap.set("n", "<leader>ql", function() require("trouble").open("loclist") end)
        vim.keymap.set("n", "<leader>qt", function() require("trouble").open("lsp_references") end)
    end
}
