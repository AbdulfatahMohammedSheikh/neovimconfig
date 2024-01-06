return {
    "dcampos/nvim-snippy",
    event = "InsertEnter",

    config = function()
        require('snippy').setup({
            mappings = {
                is = {
                    ['<Tab>'] = 'expand_or_advance',
                    ['<S-Tab>'] = 'previous',
                },
                nx = {
                   ['<leader>x'] = 'cut_text',
                },
            },
        })
        local mappings = require('snippy.mapping')
        vim.keymap.set('i', '<Tab>', mappings.expand_or_advance('<Tab>'))
        vim.keymap.set('s', '<Tab>', mappings.next('<Tab>'))
        vim.keymap.set({ 'i', 's' }, '<S-Tab>', mappings.previous('<S-Tab>'))
        vim.keymap.set('x', '<Tab>', mappings.cut_text, { remap = true })
        vim.keymap.set('n', 'g<Tab>', mappings.cut_text, { remap = true })
    end,
}
