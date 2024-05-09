return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
        { "<leader>y", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
