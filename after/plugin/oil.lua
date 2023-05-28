require('oil').setup({
	columns = {
		"icon",
	}
})

vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })
