require('lualine').setup {
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff',
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
			}
		},
		lualine_c = { 'filename' },
		lualine_x = {
			-- {
			-- 	'copilot',
			-- 	symbols = {
			-- 		status = {
			-- 			icons = {
			-- 				enabled = " ",
			-- 				sleep = " ", -- auto-trigger disabled
			-- 				disabled = " ",
			-- 				warning = " ",
			-- 				unknown = " "
			-- 			},
			-- 			hl = {
			-- 				enabled = "#00AF5F",
			-- 				sleep = "#AEB7D0",
			-- 				disabled = "#6272A4",
			-- 				warning = "#FFB86C",
			-- 				unknown = "#FF5555"
			-- 			}
			-- 		},
			-- 		spinners = require("copilot-lualine.spinners").circle_halves,
			-- 		spinner_color = "#A8A8CE"
			-- 	},
			-- 	show_colors = true,
			-- 	show_loading = true,
			-- },
			'encoding',
			'fileformat',
			'filetype'
		},
		lualine_y = { {
			'datetime',
			style = 'iso'
		} },
		lualine_z = { 'location' }
	},
}
