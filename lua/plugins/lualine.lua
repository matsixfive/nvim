return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "arkav/lualine-lsp-progress"
		},
		opts = {
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						symbols = {
							error = " ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					}
				},
				lualine_c = {
					"filename",
				},
				lualine_x = {
					{
						"lsp_status",
						icon = "", -- f013
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							done = "✓",
							separator = " ",
						},
						ignore_lsp = { "copilot" },
					},
					{
						"copilot",
						cond = function()
							-- only show if copilot is loaded
							return vim.tbl_get(require("lazy.core.config"), "plugins", "copilot.lua", "_", "loaded") ~= nil
						end,
						symbols = {
							status = {
								icons = {
									enabled = " ",
									sleep = " ",
									disabled = " ",
									warning = " ",
									unknown = " "
								},
								hl = {
									enabled = "#00AF5F",
									sleep = "#AEB7D0",
									disabled = "#6272A4",
									warning = "#FFB86C",
									unknown = "#AEB7D0",
								}
							},
						},
						show_colors = true,
						show_loading = true,
					},
					"encoding",
					"fileformat",
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" }
			},
		},
	},
}
