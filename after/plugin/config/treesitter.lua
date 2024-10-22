require('nvim-treesitter.configs').setup {
	ensure_installed = { "javascript",
		"typescript",
		"c",
		"lua",
		"rust",
		"html",
		"css"
	},
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

vim.treesitter.language.register("markdown", "mdx")

-- Show capture group for text under current cursor position
vim.keymap.set("n", "<C-e>",
	function()
		local result = vim.treesitter.get_captures_at_cursor(0)
		print(vim.inspect(result))
	end,
	{ noremap = true, silent = false }
)
