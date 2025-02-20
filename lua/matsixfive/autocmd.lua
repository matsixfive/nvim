local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank { higroup = "IncSearch", timeout = 100 }
	end,
	group = general,
	desc = "Highlight when yanking",
})

autocmd("BufEnter", {
	callback = function()
		-- any file in a directory named uni
		local is_uni = vim.regex("/uni/"):match_str(vim.fn.expand("%:p"))
		if is_uni == nil then
			-- source lua colorscheme config file
			vim.defer_fn(function()
				-- TODO: reset to colorscheme that was set before
				vim.api.nvim_command("colorscheme onedark")
				vim.cmd("GitBlameDisable")
			end, 0)
			return
		end

		-- Disable copilot
		vim.cmd("Copilot disable")
		vim.defer_fn(function()
			vim.api.nvim_command("colorscheme tokyonight")
		end, 0)

		-- Git blame
		vim.cmd("GitBlameEnable")

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
