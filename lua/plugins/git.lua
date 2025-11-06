return {
	-- cond = function()
	-- 	-- file is in a git dir
	-- 	local _, ret, _ = require("telescope.utils").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
	-- 	return ret == 0
	-- end,
	{
		"airblade/vim-gitgutter",
		event = { "VeryLazy" },
		init = function()
			vim.g.gitgutter_sign_added = "┃"
			vim.g.gitgutter_sign_modified = "┃"
			vim.g.gitgutter_sign_removed = "-"
		end,
	},
	{
		"f-person/git-blame.nvim",
		lazy = true,
		opts = {
			enabled = false,
			message_template = "  <author> • <summary> • <date> ",
			date_format = "%d-%m-%Y %H:%M:%S",
			virtual_text_column = 1,
			message_when_not_committed = "  Uncommitted ",
			highlight_group = "GitBlame"
		},
		keys = {
			{ "<leader>gb", function() require("gitblame").toggle() end, desc = "Toggle Git Blame" },
		},
	},
	{
		"FabijanZulj/blame.nvim",
		lazy = true,
		opts = {
			date_format = "%d-%m-%Y",
			focus_blame = false,
			merge_consecutive = false,
		},
		keys = {
			{
				"<leader>gB",
				function()
					require("blame")
					vim.cmd("BlameToggle")
				end,
				desc = "Toggle Blame.nvim"
			},
		},
	},
}
