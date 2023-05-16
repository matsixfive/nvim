-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    rust = {
      require("formatter.filetypes.rust"),

      -- You can also define your own configuration
      function()
        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "rustfmt"
          }
          -- stdin = true,
      end
    },

		typescriptreact = {
			require("formatter.filetypes.typescriptreact"),

			function ()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", util.escape_path(util.get_current_buffer_file_path())}
				}
			end
		},

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
