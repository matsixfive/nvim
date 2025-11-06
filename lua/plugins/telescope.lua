vim.keymap.set("n", "<leader>vh",
	require("telescope.builtin").help_tags,
	{ desc = "Telescope vim help" }
)

vim.keymap.set("n", "<leader>pg",
	require("telescope.builtin").live_grep,
	{ desc = "Telescope live grep" }
)
vim.keymap.set("n", "<leader>pf",
	require("telescope.builtin").find_files,
	{ desc = "Telescope find files" }
)

vim.keymap.set("n", "<leader>pd",
	require("telescope.builtin").diagnostics,
	{ desc = "Telescope diagnostic" }
)
vim.keymap.set("n", "<leader>pe",
	function()
		require("telescope.builtin").diagnostics({ severity = "error" })
	end,
	{ desc = "Telescope errors" }
)

vim.keymap.set("n", "<leader>cs",
	function()
		require("telescope.builtin").colorscheme({ enable_preview = true })
	end,
	{ desc = "Telescope colorscheme" }
)

vim.keymap.set("n", "<C-p>",
	function()
		local _, ret, _ = require("telescope.utils").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
		if ret == 0 then
			require("telescope.builtin").git_files()
		else
			require("telescope.builtin").find_files()
		end
	end, { desc = "Telescope git files" }
)

-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "TelescopeFindPre",
-- 	callback = function()
-- 		vim.opt_local.winborder = "none"
-- 		vim.api.nvim_create_autocmd("WinLeave", {
-- 			once = true,
-- 			callback = function()
-- 				vim.opt_local.winborder = "rounded"
-- 			end,
--
-- 		})
-- 	end,
-- })

return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		opts = {
			defaults = {
				dynamic_preview_title = true,
				path_display = { "truncate", "filename_first" },
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					}
				},
			},
		}
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", },
		lazy = true
	}
}
