local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

buf_set_keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
buf_set_keymap('n', 'K', vim.lsp.buf.hover, bufopts)
buf_set_keymap('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
buf_set_keymap('n', '<C-l>', vim.lsp.buf.signature_help, bufopts)
buf_set_keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
buf_set_keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
buf_set_keymap('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
buf_set_keymap('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
buf_set_keymap('n', '<leader>r', vim.lsp.buf.references, bufopts)
buf_set_keymap('n', ';f', vim.lsp.buf.format , bufopts)
end

local nvim_lsp = require("lspconfig")
---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
require('lspconfig')['rust_analyzer'].setup{
--    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require("lspconfig")["cssmodules_ls"].setup({
	capabilities = capabilities,
    flags = lsp_flags,
})

require("lspconfig")["emmet_ls"].setup({
	capabilities = capabilities,
})

require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
})
