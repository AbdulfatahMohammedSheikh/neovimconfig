local telescope = require('telescope')
telescope.setup{

  defaults = {
    file_ignore_patterns = {
	    "target",
        ".git"
	    },
      },

  extensions = {
	  live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting

	   }
      }
    }
