-- An autocommand for create simple snippets of code
-- this is not a repalcement for nvim-snip, I have faced problems configering nvim-snip so I jsut came up with the idea of using
-- registers

local group = vim.api.nvim_create_augroup("reg-autocmd", { clear = false })

-- General config for registers
vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
        vim.cmd([[
           call setreg('t', "//TODO: ")
           call setreg('f', "//FIXME: ")
           call setreg('b', "//BUG: ")

           " clear the use registers in ather outocommands to avoid sharing data between autocommand
		   call setreg('a', '', 'al')
        ]])
    end,
})

-- Rust

vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*.rs",
    callback = function()
        vim.cmd([[
           call setreg('a', "async fn name() {/n/n}")
        ]])
    end,
})

-- lua

vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*.lua",
    callback = function()
        vim.cmd([[
           call setreg('t', "-- TODO: ")
           call setreg('f', "-- FIXME: ")
        ]])
    end,
})
