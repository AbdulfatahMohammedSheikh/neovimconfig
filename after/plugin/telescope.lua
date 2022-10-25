local telescope = require('telescope')
telescope.setup{

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
