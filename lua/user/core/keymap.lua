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
vim.keymap.set('n', 'se', '<C-w>=') -- make the size of splites equal 
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

-- >  chage file permesions
--
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>')
