vim.keymap.set("n", "<leader>dc", function() require('neogen').generate({ type = "func", }) end)

return {
	'danymat/neogen',
	version = '*',
	lazy = true,
	opts = {},
}
