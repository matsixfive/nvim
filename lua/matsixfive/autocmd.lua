local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	callback = function()
		require("vim.hl").on_yank { higroup = "IncSearch", timeout = 100 }
	end,
	desc = "Highlight when yanking",
})

autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove("o")
	end,
	desc = "Disable comment insertion on `o`",
})

local ns = vim.api.nvim_create_namespace("length_check")
autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
	callback = function()
		if not vim.b.length_check then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		vim.diagnostic.reset(ns, bufnr)

		local colorcolumnstr = vim.api.nvim_get_option_value("colorcolumn", { scope = "local" })
		if colorcolumnstr == "" then
			return
		end

		local colorcolumn = tonumber(colorcolumnstr)

		local diagnostics = {}
		for lnum, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
			if #line > colorcolumn then
				table.insert(diagnostics, {
					lnum = lnum - 1,
					col = colorcolumn,
					severity = vim.diagnostic.severity.INFO,
					message = "Line exceeds " .. colorcolumnstr .. " characters",
					source = "length_check",
				})
			end
		end

		vim.diagnostic.set(ns, bufnr, diagnostics, {})
	end,
})

local uni_group = vim.api.nvim_create_augroup("Uni", { clear = true })

local check_uni = function()
	-- any file in a directory named uni
	local is_uni = vim.regex("/uni/"):match_str(vim.fn.getcwd())
	return is_uni ~= nil
end

autocmd("VimEnter", {
	callback = function()
		local is_uni = check_uni()
		vim.g.is_uni = is_uni

		if is_uni then
			vim.api.nvim_exec_autocmds("User", { pattern = "UniEnter" })
		end
	end,
	group = uni_group,
	desc = "Disable copilot for university files",
})

autocmd("DirChanged", {
	callback = function()
		local old_is_uni = vim.g.is_uni
		local is_uni = check_uni()
		vim.g.is_uni = is_uni

		if old_is_uni == is_uni then
			return
		end

		if is_uni then
			vim.api.nvim_exec_autocmds("User", { pattern = "UniEnter" })
		else
			vim.api.nvim_exec_autocmds("User", { pattern = "UniLeave" })
		end
	end,
	group = uni_group,
	desc = "Disable copilot for university files",
})


autocmd("User", {
	pattern = "UniEnter",
	callback = function()
		require("copilot.command").disable()
		require("gitblame").enable()

		vim.defer_fn(function()
			require("tokyonight")
			vim.api.nvim_command("colorscheme tokyonight")
		end, 0)
	end,
	group = uni_group,
	desc = "Set indentation for university files",
})

autocmd("User", {
	pattern = "UniLeave",
	callback = function()
		-- source tokyonight colorscheme
		vim.defer_fn(function()
			require("tokyonight")
			vim.api.nvim_command("colorscheme tokyonight")
		end, 0)

		require("copilot.command").disable()
	end,
	group = uni_group,
	desc = "Set indentation for non-university files",
})
