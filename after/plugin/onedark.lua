require("onedark").setup {
	style = 'darker',
	colors = {
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
	},
	highlights = {
		ColorColumn = { bg = "$bg0_5" },
		CursorLine = { bg = "$bg1" },
		["@character"] = { fg = '$light_green' },
		["@string.escape"] = { fg = '$light_red' },
	}
}

require('onedark').load()

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.colorcolumn = "80"

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
	trail = "·",
	-- extends = "❯",
	-- precedes = "❮",
	extends = "…",
	precedes = "…",
}

vim.opt.list = true

local diagnosticIcons = {
	DefaultOutline = " ",
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

-- -- wrong code for e.g
-- o = vim.o
-- local thing = l
-- l

for _, name in ipairs({"Error", "Warn", "Hint", "Info"}) do
	local hl = "DiagnosticSign" .. name
	local icon = diagnosticIcons[name]
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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
