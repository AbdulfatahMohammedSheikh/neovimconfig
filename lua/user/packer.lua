-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {"windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end}
  use 'folke/tokyonight.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
-- Debugging
  use 'mfussenegger/nvim-dap'
  -- for code compliction
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use {  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
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
end)
