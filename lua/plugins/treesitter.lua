-- Show capture group for text under current cursor position
-- vim.keymap.set("n", "<C-e>",
-- 	function()
-- 		local result = vim.treesitter.get_captures_at_cursor(0)
-- 		vim.print(result)
-- 	end,
-- 	{ noremap = true, silent = false }
-- )

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.config',
	lazy = false,
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
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

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.mcfunction = {
			install_info = {
				url = "https://github.com/theusaf/tree-sitter-mcfunction-lang", -- local path or git repo
				files = { "src/parser.c" },                         -- note that some parsers also require src/scanner.c or src/scanner.cc
			},
		}

		-- .mcfunction filetype
		vim.filetype.add({
			extension = {
				mcfunction = "mcfunction",
			},
		})
	end
}
