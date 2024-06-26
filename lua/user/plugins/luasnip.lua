return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip") --{{{

        -- require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets/" })
        require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

        vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}


        -- Virtual Text{{{
        ls.config.set_config({
            history = true,                            --keep around last snippet local to jump back
            updateevents = "TextChanged,TextChangedI", --update changes as you type
            enable_autosnippets = true,
        }) --}}}

        -- Key Mapping --{{{


        vim.keymap.set({ "i", "s", "n" }, "snp", function()
            if ls.expand_or_jumpable() then
                ls.expand()
            end
        end, { silent = true })
        vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true })
        -- vim.keymap.set({ "i", "s" }, "<C-k>", function()
        -- 	if ls.expand_or_jumpable() then
        -- 		ls.expand_or_jump()
        -- 	end
        -- end, { silent = true })
        -- vim.keymap.set({ "i", "s" }, "<C-j>", function()
        -- 	if ls.jumpable() then
        -- 		ls.jump(-1)
        -- 	end
        -- end, { silent = true })

        vim.keymap.set({ "i", "s", "n" }, "<a-y>", "<Esc>o", { silent = true })

        vim.keymap.set({ "i", "s", "n" }, "snl", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { silent = true })
        vim.keymap.set({ "i", "s", "n" }, "snh", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s", "n" }, "snj", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)
        vim.keymap.set({ "i", "s", "n" }, "snk", function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end) --}}}

        -- More Settings --

        vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
        vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
    end
}
