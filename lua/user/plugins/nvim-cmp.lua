return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",       -- source for text in buffer
        "hrsh7th/cmp-path",         -- source for file system paths
        "L3MON4D3/LuaSnip",         -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "hrsh7th/cmp-nvim-lsp",
        --    "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")


        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                -- Add tab support
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                })
            },
            sources = {
                { name = "luasnip" },
                { name = "nvim_lsp", max_item_count = 6 },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "buffer",   max_item_count = 6 },
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            -- documentation = {
            -- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            -- },
            -- experimental = {
            -- 	ghost_text = true,
            -- 	native_menu = false,
            -- },
        })
    end,
}
