local  nnoremap = require("user.keymap").nnoremap
local key_mapper= function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end
-- initial settup and mappting
key_mapper('i', 'jj', '<ESC>')
-- use jj as a hotkey for exiting termaianl mode
key_mapper('t', 'jj', '<C-\\><C-n>')
key_mapper('n', '<leader>s', ':w<CR>')
key_mapper('n', '<leader>;', ':q<CR>')
key_mapper('n', '<leader>e', ':wq<CR>')
key_mapper('n', '<leader>o', ':e %:h<CR>')
key_mapper('n', '<leader>p', ':Ex<CR>')
key_mapper('n', '<leader>t', ':so<CR>')
key_mapper('n', '<leader>v', ':belowright terminal<CR>')

 --     Windows and navigation 
 --
 -- > Resizing window

key_mapper('n', '<C-UP>', ':resize -2 <CR>')
key_mapper('n', '<C-DOWN>', ':resize +2 <CR>')
key_mapper('n', '<C-lEFT>', ':vertical resize -2 <CR>')
key_mapper('n', '<C-RIGHT>', ':vertical resize +2 <CR>')

 -- >  vsplite

key_mapper('n', '<C-s>', ':vsplit<CR>')

 -- >  Split navigation
key_mapper('n', '<leader>l', ':bnext<CR>')
key_mapper('n', '<leader>h', ':bprevious<CR>')
key_mapper('n', '<leader>b', ':bd<CR>')

 --     Code props   
 -- 
 -- > Quickfix list
 --

key_mapper('n', '<leader>q', ':copen<CR>')
key_mapper('n', '<leader>k', ':cprev<CR>')
key_mapper('n', '<leader>j', ':cnext<CR>')

 -- >  Formating 
 --

key_mapper('n', '<C-j>', ':m .+1<CR>')
key_mapper('n', '<C-k>', ':m .-2<CR>')


 -- >  Telescope 
 --

-- Find files using Telescope command-line sugar.
key_mapper('n', '<leader>ff', ':Telescope find_files<CR>')
key_mapper('n', '<leader>fb', ':Telescope buffers<CR>')
key_mapper('n', '<leader>fh', ':Telescope help_tags<CR>')


-- Gernal lsp maps for all languages
--
local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
vim.keymap.set('n', ';f', vim.lsp.buf.formatting, bufopts)
