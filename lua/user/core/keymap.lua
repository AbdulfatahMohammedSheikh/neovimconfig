-- initial settup and mappting
vim.keymap.set('i', 'jj', '<ESC>')
-- go back to the previous file
vim.keymap.set('n', "<leader>'", '<C-6>')
-- use jj as a hotkey for exiting termaianl mode
vim.keymap.set('t', 'jj', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>;', ':q<CR>')
vim.keymap.set('n', '<leader>e', ':wq<CR>')
vim.keymap.set('n', '<leader>o', ':e %:h<CR>')
vim.keymap.set('n', '<leader>p', ':Ex<CR>')
vim.keymap.set('n', '<leader>t', ':so<CR>')
vim.keymap.set('n', '<leader>v', ':belowright terminal<CR>')

-- for fast rename and refactoring
vim.keymap.set('n', '<leader>u', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]])
--     Windows and navigation
--
-- > Resizing window

vim.keymap.set('n', '<C-UP>', ':resize -2 <CR>')
vim.keymap.set('n', '<C-DOWN>', ':resize +2 <CR>')
vim.keymap.set('n', '<C-lEFT>', ':vertical resize -2 <CR>')
vim.keymap.set('n', '<C-RIGHT>', ':vertical resize +2 <CR>')

-- >  increament and decreament numbers

vim.keymap.set('n', '<leader>=', '<C-a>') -- in my keyboard + and = is in the same key so if is want + is must also use Shift
vim.keymap.set('n', '<leader>-', '<C-x>')


-- >  splites

vim.keymap.set('n', 'sv', ':split<CR>')
vim.keymap.set('n', 's;', ':vsplit<CR>')
vim.keymap.set('n', 'so', '<C-w>o')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'se', '<C-w>=')     -- make the size of splites equal
vim.keymap.set('n', 'sd', ':close<CR>') -- close current split



-- >  Split navigation
vim.keymap.set('n', '<leader>b', ':bd<CR>')

--     Code props
--
-- > Quickfix list
--

vim.keymap.set('n', '<leader>q', ':copen<CR>')
vim.keymap.set('n', '<leader>k', ':cprev<CR>')
vim.keymap.set('n', '<leader>j', ':cnext<CR>')
vim.keymap.set('n', '<leader>l', ':lopen<CR>')

-- >  Formating
--

vim.keymap.set('n', '<C-j>', ':m .+1<CR>')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>')

-- >  Code Floding
--

-- did not remove it just to remomber code folding
-- vim.keymap.set('v', '<C-UP>', 'zf')
-- vim.keymap.set('v', '<C-DOWN>', 'zo')
--
-- >  chage file permesions
--
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>')



-- >  Gneral lsp config to tell nvim that if we did not configer the langualge server to just
-- do its best and use the fellowing config as default
--
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<C-l>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references)
vim.keymap.set('n', ';f', function() vim.lsp.buf.format { async = true } end)

-- Dap
vim.keymap.set('n', '<leader>d', ':DapContinue<CR>')
vim.keymap.set('n', '<leader>dp', ':DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<leader>de', ':DapTerminate<CR>')
vim.keymap.set('n', '<leader>dt', ':lua require("dapui").toggle()<CR>')

-- not the cleanest code but it get the job done
vim.keymap.set('n', '<leader>wi', function()
    local i = vim.fn.input("task : ")
    local tag = vim.fn.input("tag : ")
    local command = "watson start " .. i .. " +" .. tag
    vim.fn.jobstart(command, { detach = true })
end)

vim.keymap.set('n', '<leader>wo', function()
    vim.fn.jobstart("watson stop", { detach = true })
end
)

vim.keymap.set('n', '<leader>wj', ':!watson status <CR>')
