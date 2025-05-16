-- Show capture group for text under current cursor position
vim.keymap.set("n", "<C-e>",
	function()
		local result = vim.treesitter.get_captures_at_cursor(0)
		vim.print(result)
	end,
	{ noremap = true, silent = false }
)

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.config',
	lazy = true,
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				"c",
				"lua",
				"rust",
				"html",
				"css",
				"comment",
				"jsdoc",
			},
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}

		vim.treesitter.language.register("markdown", "mdx")
	end
}
