vim.keymap.set("n", "<leader>gB", function()
	require('blame')
	vim.cmd("BlameToggle")
end, { noremap = true, silent = true })

return {
	"FabijanZulj/blame.nvim",
	lazy = true,
	opts = {},
}
