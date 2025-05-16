vim.keymap.set('n', '<leader>j', function() require('treesj').toggle() end, { desc = 'Toggle Treesj' })

return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	lazy = true,
	opts = {
		use_default_keymaps = false,
		max_join_length = 1000,
	},
}
