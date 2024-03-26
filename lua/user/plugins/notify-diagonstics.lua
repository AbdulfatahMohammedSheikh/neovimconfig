return {
    'tomdeneire/notify-diagnostics.nvim',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { 'rcarriga/nvim-notify' },
    branch = "main",
    config = function()
        local max_width = math.floor(vim.o.columns * 0.25)
        require("notify-diagnostics").setup({ max_width = max_width })
        require("notify").setup({ max_width = max_width })
    end
}
