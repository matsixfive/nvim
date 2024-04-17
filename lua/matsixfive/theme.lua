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

function test()
	
end

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
	underline = true,
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
