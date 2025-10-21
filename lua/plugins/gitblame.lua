vim.keymap.set("n", "<leader>gb", function() require('gitblame').toggle() end, { noremap = true, silent = true })

return {
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
}
