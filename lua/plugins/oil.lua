return {
	{
		"stevearc/oil.nvim",
		opts = {
			-- default_line = 2,
			columns = {
				-- "permissions",
				"icon",
			},
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				-- ["<C-s>"] = "actions.select_vsplit",
				-- ["<C-h>"] = "actions.select_split",
				-- ["<C-t>"] = "actions.select_tab",
				-- ["<C-p>"] = "actions.preview",
				["<Esc>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["g."] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _bufnr)
					return name == ".."
				end,
			},

			-- oil-git-status.nvim options
			win_options = {
				signcolumn = "yes:1",
			},
		},
		config = function(_, opts)
			require("oil").setup(opts)
			vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

			if opts.default_line ~= nil then
				vim.api.nvim_create_autocmd("BufEnter", {
					callback = function(opts2)
						if vim.bo[opts2.buf].filetype ~= "oil" then
							return
						end
						if vim.fn.line(".") == 1 then
							-- when oil opens it contains no lines and they are
							-- filled in after so we need to wait and check until
							-- there is a line to move to for a maximum of 100ms
							for _ = 1, 10 do
								if vim.fn.line("$") > 1 then
									vim.api.nvim_win_set_cursor(0, { opts.default_line, 0 })
									break
								end
								vim.wait(10)
							end
						end
					end,
					desc = "Move cursor to second line in oil",
				})
			end
		end
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		event = "VeryLazy",
		opts = {
			show_ignored = true,
		}
	}
}
