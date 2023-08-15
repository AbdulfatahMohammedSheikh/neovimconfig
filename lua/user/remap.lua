local nnoremap = require("user.keymap").nnoremap
local set_keymap = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        { noremap = true, silent = true }
    )
end
-- initial settup and mappting
set_keymap('i', 'jj', '<ESC>')
set_keymap('n', 'y', 'yy')
set_keymap('n', 'x', '"_x')
set_keymap('n', '<C-a>', 'gg<S-v>G')

-- TODO: this is a feature for go but can be used instead of snipet engne
--set_keymap('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err')

-- go back to the previous file
set_keymap('n', "<leader>'", '<C-6>')
-- use jj as a hotkey for exiting termaianl mode
set_keymap('t', 'jj', '<C-\\><C-n>')
set_keymap('n', '<leader>s', ':w<CR>')
set_keymap('n', '<leader>;', ':q<CR>')
set_keymap('n', '<leader>e', ':wq<CR>')
set_keymap('n', '<leader>o', ':e %:h<CR>')
set_keymap('n', '<leader>p', ':Ex<CR>')
set_keymap('n', '<leader>t', ':so<CR>')
set_keymap('n', '<leader>v', ':belowright terminal<CR>')

-- for fast rename and refactoring
set_keymap('n', '<leader>u', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]])
--     Windows and navigation
--
-- > Resizing window

set_keymap('n', '<C-UP>', ':resize -2 <CR>')
set_keymap('n', '<C-DOWN>', ':resize +2 <CR>')
set_keymap('n', '<C-lEFT>', ':vertical resize -2 <CR>')
set_keymap('n', '<C-RIGHT>', ':vertical resize +2 <CR>')

-- >  increament and decreament numbers

set_keymap('n', '<leader>=', '<C-a>') -- in my keyboard + and = is in the same key so if is want + is must also use Shift
set_keymap('n', '<leader>-', '<C-x>')


-- >  splites

set_keymap("n", "<Space>", "<C-w>w")
set_keymap('n', 'sv', ':split<CR>')
set_keymap('n', 's;', ':vsplit<CR>')
set_keymap('n', 'so', '<C-w>o')
set_keymap('n', 'sj', '<C-w>j')
set_keymap('n', 'sk', '<C-w>k')
set_keymap('n', 'sl', '<C-w>l')
set_keymap('n', 'sh', '<C-w>h')
set_keymap('n', 'se', '<C-w>=')     -- make the size of splites equal
set_keymap('n', 'sd', ':close<CR>') -- close current split


-- >  Code Floding

set_keymap('v', ';j', 'zf')
set_keymap('v', ';k', 'zo')

-- >  Split navigation
set_keymap('n', '<leader>b', ':bd<CR>')

--     Code props
--
-- > Quickfix list
--

set_keymap('n', '<leader>q', ':copen<CR>')
set_keymap('n', '<leader>k', ':cprev<CR>')
set_keymap('n', '<leader>j', ':cnext<CR>')
set_keymap('n', '<leader>l', ':lopen<CR>')

-- >  Formating
--

set_keymap('n', '<C-j>', ':m .+1<CR>')
set_keymap('n', '<C-k>', ':m .-2<CR>')

-- >  chage file permesions
--
set_keymap('n', '<leader>x', ':!chmod +x %<CR>')

-- >  Telescope
--

-- Find files using Telescope command-line sugar.
set_keymap('n', '<leader>ff', ':Telescope find_files<CR>')
set_keymap('n', '<leader>fb', ':Telescope buffers<CR>')
set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>')
set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>')
set_keymap('n', '<leader>fj', ':Telescope grep_string<CR>')


-- >  Dap and Dap-ui
--


set_keymap('n', '<leader>d', ':DapContinue<CR>')
set_keymap('n', '<leader>dp', ':DapToggleBreakpoint<CR>')
set_keymap('n', '<leader>dt', ':lua require("dapui").toggle()<CR>')
set_keymap('n', '<leader>de', ':DapTerminate<CR>')
-- Gernal lsp maps for all languages
--
local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-l>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', ';f', vim.lsp.buf.format, bufopts)

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>i", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

-- Flutter

vim.keymap.set("n", "<leader>fs", ":FlutterRestart<CR>")
vim.keymap.set("n", "<leader>fr", ":FlutterReload<CR>")
vim.keymap.set("n", "<leader>fd", ":FlutterDevices<CR>")
vim.keymap.set("n", "<leader>ft", ":FlutterDevTools<CR>")

-- Hop

vim.keymap.set("n", "<leader>hw", ":HopWord<CR>")
vim.keymap.set("n", "<leader>hl", ":HopLine<CR>")


-- Window movement
vim.keymap.set('', '<C-w><left>', '<C-w><')
vim.keymap.set('', '<C-w><right>', '<C-w>>')
vim.keymap.set('', '<C-w><up>', '<C-w>+')
vim.keymap.set('', '<C-w><down>', '<C-w>-')
