require('gitblame').setup {
	--Note how the `gitblame_` prefix is omitted in `setup`
	enabled = true, -- if you want to enable the plugin
	message_template = "  <author> • <summary> • <date> ", -- template for the blame message, check the Message template section for more options
	date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
	virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
	message_when_not_committed = "  Uncommitted ",
	-- same highlight group as cursorline highlight
	highlight_group = "GitBlame",
}

vim.g.gitblame_display_virtual_text = 0

vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { noremap = true, silent = true })
