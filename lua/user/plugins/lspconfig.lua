return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        -- TODO: remove unnassary ots from the keymas here
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>qq', vim.diagnostic.setloclist, opts)


        local on_attach = function(client, bufnr)
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-l>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', ';f', function() vim.lsp.buf.format { async = true } end, bufopts)

            vim.keymap.set('n', '<leader>dl', require("telescope.builtin").lsp_document_symbols, bufopts)
            vim.keymap.set('n', '<leader>do', require("telescope.builtin").lsp_dynamic_workspace_symbols, bufopts)




            -- We can add more keymaps for spesific lsp by using the fallowing config
            --   if client.name == "tsserver" then
            --  end
        end


        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true


        require("mason").setup()
        require("mason-lspconfig").setup()
        local lsp_flags = {
            -- This is the default in Nvim 0.7+
            debounce_text_changes = 150,
        }
        lspconfig['rust_analyzer'].setup {
            --            on_attach = on_attach,
            flags = lsp_flags,
            -- Server-specific settings...
            settings = {
                ["rust-analyzer"] = {},
            }
        }
        lspconfig['lua_ls'].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
                lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                }
            }
        }

        lspconfig['gopls'].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags
        }


        lspconfig['dartls'].setup {
            capabilities = capabilities,
            flags = lsp_flags

        }

        lspconfig["tsserver"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags
        }


        lspconfig['emmet_ls'].setup {
            capabilities = capabilities,
            filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte",
                "pug", "typescriptreact", "vue" },
            init_options = {
                html = {
                    options = {
                        ["bem.enabled"] = true,
                    }
                }
            }
        }

        lspconfig['cssls'].setup {
            capabilities = capabilities,
            flags = lsp_flags
        }

        lspconfig['tailwindcss'].setup {
            capabilities = capabilities,
            flags = lsp_flags,
            filetypes = { "templ", "astro", "javascript", "typescript", "react" },
            init_options = { userLanguages = { templ = "html" } },
        }


        lspconfig['html'].setup {
            capabilities = capabilities,
            flags = lsp_flags,
            filetypes = { "html", "templ" },
        }
    end,

}
