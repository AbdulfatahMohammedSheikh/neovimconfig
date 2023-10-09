return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "lua", "rust", "go", "javascript" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            ignore_install = { "vim", "bash" },


            highlight = {
                enable = true,

                disable = { "vim", "bash" },
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            -- TODO: add incremtal selection and context_copmentstreing
            autotag = {
                enable = true,
            }
        }
    end
}
