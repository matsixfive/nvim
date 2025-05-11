return {
	{
		'nvim-telescope/telescope.nvim',
		lazy = true,
		opts = {
			defaults = {
				danamic_preview_title = true,
				mappings = {
					i = {
						["<C-j>"] = require('telescope.actions').move_selection_next,
						["<C-k>"] = require('telescope.actions').move_selection_previous,
					}
				},
			},
		}
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', },
		lazy = true
	}
}
