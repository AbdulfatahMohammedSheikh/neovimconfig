return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local telescope = require('telescope')
        telescope.setup {

            defaults = {
                file_ignore_patterns = {
                    "target",
                    ".git",
                    -- for flutter projects
                    ".class",
                    ".log",
                    ".pyc",
                    ".swp",
                    ".DS_Store",
                    ".atom",
                    ".buildlog",
                    ".history",
                    ".svn",
                    "migrate_working_dir",
                    ".dart_tool",
                    ".idea",
                    "android",
                    "ios",
                    "web",
                    "linux",
                    "windows",
                    "build",
                    "macos",
                    "assets"
                },
            },

            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting

                }
            }
        }
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fj', builtin.grep_string, {})
    end,
}
