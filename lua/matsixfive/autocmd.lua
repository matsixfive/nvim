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
