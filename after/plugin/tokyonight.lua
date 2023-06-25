require("tokyonight").setup({
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
	on_colors = function (colors)
		colors.bg = '#231f20'
		colors.bg_dark = '#110f10'
		colors.bg_float = '#2d2929'
		colors.bg_visual = '#423d3f'
		colors.bg_statusline = colors.bg_visual
		colors.bg_highlight = '#2a2525'

		colors.fg = '#fbf7d6'
		colors.fg_gutter = '#45433d'

		colors.green = '#addb67'
		colors.green1 = colors.fg
		colors.orange = '#f56f24'
		colors.yellow = '#ffb527'
		colors.purple = '#7e64b8'
		colors.blue = '#19b8eb'
		colors.magenta = '#f180a2'
		colors.red = '#f72532'

		colors.gitSigns = {
			add = '#0ab04d',
			change = colors.fg,
			delete = colors.red
		}

		colors.comment = '#848174'
	end,

	on_highlights = function (highlights, colors)
		highlights["@punctuation.bracket"] = {
			fg = colors.blue
		}
		-- highlights["@punctuation.delimeter"] = {
		-- 	fg = colors.blue
		-- }
		highlights.DiagnosticVirtualTextWarn = {
			bg = colors.bg_float,
			fg = colors.orange
		}
	end
})

vim.cmd[[colorscheme tokyonight]]
