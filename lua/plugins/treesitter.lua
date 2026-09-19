return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup()

			require("nvim-treesitter").install({
				"lua",
				"rust",
				"html",
				"css",
				"comment",
				"jsdoc",
			})

			vim.treesitter.language.register("markdown", "mdx")
		end
	},
}
