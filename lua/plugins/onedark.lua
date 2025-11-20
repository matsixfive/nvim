local colors = {
	black = "#0e1013",
	bg0 = "#191a1c",
	bg0_5 = "#1c1d1f",
	bg1 = "#222426",
	bg2 = "#2b2e30",
	bg3 = "#34383a",
	bg_d = "#111214",
	bg_blue = "#47a7f5",
	bg_yellow = "#f7c56a",
	fg = "#b6bdc7",
	fg_faint = "#4c5255",
	purple = "#cf4bf6",
	green = "#8bd553",
	light_green = "#6aee3a",
	orange = "#f68f2d",
	blue = "#1996fb",
	yellow = "#fdc050",
	cyan = "#22cee3",
	red = "#fc3e4e",
	light_red = "#f17681",
	grey = "#535965",
	light_grey = "#8f95a0",
	dark_cyan = "#10737f",
	dark_red = "#8b3434",
	dark_yellow = "#835d1a",
	dark_purple = "#7e3992",
	diff_add = "#272e23",
	diff_delete = "#2d2223",
	diff_change = "#172a3a",
	diff_text = "#274964",
}

return {
	"navarasu/onedark.nvim",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("onedark")
	end,
	opts = {
		style = "warmer",
		colors = colors,
		code_style = {
			comments = "italic",
			keywords = "bold",
			functions = "none",
			strings = "none",
			variables = "none",
		},
		diagnostics = {
			undercurl = true,
		},
		highlights = {
			ColorColumn        = { bg = colors.bg0_5 },
			CursorLine         = { bg = colors.bg1 },

			["@character"]     = { fg = colors.light_green },
			["@string.escape"] = { fg = colors.light_red },

			GitBlame           = { bg = colors.bg1, fg = colors.fg_faint },

			GitGutterAdd       = { fg = colors.green },
			GitGutterChange    = { fg = colors.blue },
			GitGutterDelete    = { fg = colors.red },
		}
	}
}
