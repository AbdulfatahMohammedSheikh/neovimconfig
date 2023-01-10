-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
		buf_set_keymap_keymap(bufnr, ...)
	end  -- Enable completion triggered by <c-x><c-o>
  buf_set_keymap_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

 -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
    buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  buf_set_keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  buf_set_keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  buf_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  buf_set_keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  buf_set_keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  buf_set_keymap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  buf_set_keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  buf_set_keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  buf_set_keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  buf_set_keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  buf_set_keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig')['rust_analyzer'].setup{
--    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['emmet_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['html'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['cssmodules_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
