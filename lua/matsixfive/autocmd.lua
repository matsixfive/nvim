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
autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
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

autocmd("BufEnter", {
	callback = function(opts)
		if vim.bo[opts.buf].filetype ~= "oil" then
			return
		end
		if vim.fn.line(".") == 1 then
			-- when oil opens it contains no lines and they are
			-- filled in after so we need to wait and check until
			-- there is a line to move to for a maximum of 100ms
			for _ = 1, 10 do
				if vim.fn.line("$") > 1 then
					vim.api.nvim_win_set_cursor(0, { 2, 0 })
					break
				end
				vim.wait(10)
			end
		end
	end,
	desc = "Move cursor to second line in oil",
})

local uni_group = vim.api.nvim_create_augroup("Uni", { clear = true })

autocmd({ "DirChanged", "VimEnter" }, {
	callback = function()
		-- any file in a directory named uni
		local is_uni = vim.regex("/uni/"):match_str(vim.fn.getcwd())
		vim.g.is_uni = is_uni ~= nil

		if is_uni == nil then
			-- source lua colorscheme config file
			vim.defer_fn(function()
				vim.api.nvim_command("colorscheme onedark")
			end, 0)

			require("copilot.command").enable()

			return
		end

		require("copilot.command").disable()
		require("gitblame").enable()

		vim.defer_fn(function()
			require("tokyonight")
			vim.api.nvim_command("colorscheme tokyonight")
		end, 0)
	end,
	group = uni_group,
	desc = "Disable copilot for university files",
})
