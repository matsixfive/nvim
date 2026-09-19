return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua",
				"rust",
				"html",
				"css",
				"comment",
				"jsdoc",
			},
		}
	},
}
