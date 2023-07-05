require("tokyonight").setup({
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

		highlights.DiagnosticVirtualTextWarn = {
			bg = colors.bg_float,
			fg = colors.orange
		}

		highlights.VertSplit = {
			fg = colors.bg_highlight
		}
	end
})

vim.cmd [[colorscheme tokyonight]]

vim.opt.fillchars = {
	vert = "‖",
	fold = " ",
	diff = "╱",
	msgsep = "‾",
	eob = " ",
}

vim.opt.listchars = {
	tab = "┊ ",
	nbsp = "˽",
	-- space = "⋅",
	-- eol = "↴",
	-- trail = "·",
	-- extends = "❯",
	-- precedes = "❮",
}

vim.opt.list = true

local diagnosticIcons = {
	DefaultOutline = " ",
	ErrorOutline = " ",
	WarnOutline = " ",
	HintOutline = " ",
	InfoOutline = " ",
	Default= " ",
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

vim.diagnostic.config({
	virtual_text = {
		spacing = 3,
		update_in_insert = true,
		prefix = "",
		suffix = " ",
		format = function(diagnostic)
			diagnostic.message = diagnostic.message:gsub("\n", " ⏎ ")
			if diagnostic.message == "Undefined global `vim`." then
				return " Your life is nothing, you serve zero purpose, you should kill yourself NOW, and give somebody else a piece of that oxygen in the ozone layer that's covered up so we can breathe inside of this blue trapped bubble. Like what are you even here for? To worship me? Kill yourself. and I mean that with a hundred percent, with a thousand percent."
			end
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return diagnosticIcons.Error .. diagnostic.message
			end
			if diagnostic.severity == vim.diagnostic.severity.WARN then
				return diagnosticIcons.Warn .. diagnostic.message
			end
			if diagnostic.severity == vim.diagnostic.severity.INFO then
				return diagnosticIcons.Info .. diagnostic.message
			end
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				return diagnosticIcons.Hint .. diagnostic.message
			end
			return diagnosticIcons.Default .. diagnostic.message
		end,
	},
})
