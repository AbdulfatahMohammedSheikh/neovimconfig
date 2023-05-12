vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end }
    use 'folke/tokyonight.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    -- Debugging
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui" }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }

    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- TODO: configure playground
    use 'nvim-treesitter/playground'
    use 'ThePrimeagen/harpoon'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    use {
        'numToStr/Comment.nvim',
    }


    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }
end)
