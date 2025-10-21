vim.keymap.set("n", "<leader>gb", function() require('gitblame').toggle() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gB", function()
	require('blame')
	vim.cmd("BlameToggle")
end, { noremap = true, silent = true })

vim.g.gitgutter_sign_added = '┃'
vim.g.gitgutter_sign_modified = '┃'
vim.g.gitgutter_sign_removed = '-'

return {
	{
		'airblade/vim-gitgutter',
	},
	{
		'f-person/git-blame.nvim',
		lazy = true,
		opts = {
			enabled = false,
			message_template = "  <author> • <summary> • <date> ",
			date_format = "%d-%m-%Y %H:%M:%S",
			virtual_text_column = 1,
			message_when_not_committed = "  Uncommitted ",
			highlight_group = "GitBlame"
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
	},
}
