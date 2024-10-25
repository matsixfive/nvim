local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank { higroup = "IncSearch", timeout = 100 }
	end,
	group = general,
	desc = "Highlight when yanking",
})

autocmd("BufEnter", {
	callback = function(args)
		local bufnr = args.buf

		local fisrt_line = vim.fn.getbufoneline(bufnr, 1)
		local is_university_file = string.match(fisrt_line, "!!uni")
		if not is_university_file then
			return
		end
		-- Disable copilot
		vim.cmd("Copilot disable")

		local filetype = vim.bo.filetype
		local options = UniOptTable[filetype]
		if options ~= nil then
			options()
		end
	end,
	group = general,
	desc = "Disable copilot for university files",
})

UniOptTable = {
	["java"] = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true
		vim.opt.colorcolumn = "80"
	end,
}
