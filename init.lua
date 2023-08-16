local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Configuration must be done before calling the setup of lazy
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = false
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.wrap = false


vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup({
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    'folke/tokyonight.nvim',
    'EdenEast/nightfox.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },

    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',
    -- Debugging
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui" },

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    --    "hrsh7th/nvim-cmp",
    --   config = [[require('config.nvim-cmp')]],
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-omni",
    },
    { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
    },

    {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you build Neovim nightly or dev builds!)
    },
    {
        'tanvirtin/vgit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }

    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- TODO: configure playground
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        'numToStr/Comment.nvim',
    },



    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    },


    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    }
})
require("user")
