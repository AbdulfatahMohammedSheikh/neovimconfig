-- vim.g.tokyonight_transparent_sidebar =true
-- vim.cmd[[colorscheme tokyonight]]
--
-- TODO: create a funtin to manage color switching 
--
require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

vim.cmd("colorscheme nightfox")
