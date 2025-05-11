return {
	"folke/tokyonight.nvim",
	lazy = true,
	opts = {
		style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
			functions = { italic = false },
			variables = { italic = false },
		},
		on_colors = function(colors)
			colors.bg = '#231f20'
			colors.bg_dark = '#110f10'
			colors.bg_float = '#2d2929'
			colors.bg_visual = '#423d3f'
			colors.bg_statusline = "#383435"
			colors.bg_highlight = '#2a2525'

			colors.fg = '#fbf7d6'
			colors.fg_gutter = '#4f494c'

			colors.green = '#addb67'
			colors.green1 = colors.fg
			colors.orange = '#f56f24'
			colors.yellow = '#ffb527'
			colors.purple = '#7e64b8'
			colors.blue = '#19b8eb'
			colors.magenta = '#f180a2'
			colors.red = '#f72532'

			colors.border = colors.bg_statusline

			colors.gitSigns = {
				add = '#0ab04d',
				change = colors.orange,
				delete = colors.red
			}

			colors.diff = {
				add = "#26482a",
				text = "#b9572a",
				change = "#633323",
				delete = "#642225"
			}

			colors.comment = '#848174'
		end,
		on_highlights = function(highlights, colors)
			highlights["@punctuation.bracket"] = {
				fg = colors.blue
			}

			highlights["ColorColumn"] = {
				bg = colors.bg_highlight
			}

			highlights["CursorLineNr"] = {
				bg = colors.bg_highlight,
				fg = colors.fg_gutter
			}

			highlights["DiagnosticVirtualTextWarn"]= {
				bg = colors.bg_float,
				fg = colors.orange
			}

			highlights["VertSplit"] = {
				fg = colors.bg_highlight
			}

			highlights["GitBlame"] = {
				bg = colors.bg_highlight,
				fg = colors.fg_gutter
			}
		end
	}
}
