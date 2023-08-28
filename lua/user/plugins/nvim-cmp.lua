return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",   -- source for text in buffer
        "hrsh7th/cmp-path",     -- source for file system paths
        "L3MON4D3/LuaSnip",     -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "hrsh7th/cmp-nvim-lsp",
        --    "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require("luasnip")
        --require("luasnip.loaders.from_vscode").lazy_load()
        vim.opt.completeopt = "menu,menuone,noselect"
        cmp.setup({
            -- Enable LSP snippets
            snippet = {
                expand = function(args)
                    -- TODO make expand work
                    -- vim.fn["vsnip#anonymous"](args.body)
                    luasnip.lsp_expand(args.body)
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

            -- Installed sources
            sources = {
                { name = 'nvim_lsp' },
                --    { name = 'vsnip' }, -- did not install this yet TODO: understand this and why we need it
                { name = 'path' },
                { name = 'buffer' },
            },
        })
    end,
}
