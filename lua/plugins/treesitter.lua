return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
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
