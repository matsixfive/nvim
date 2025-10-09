vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format({ async = true }) end)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"williamboman/mason-lspconfig.nvim",
			"Saghen/blink.cmp",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			-- Setup Mason
			mason.setup()
			mason_lspconfig.setup({
				ensure_installed = {
					"cssls",
					"emmet_language_server",
					"jdtls",
					"lua_ls",
					"rust_analyzer",
					"tailwindcss",
					"ts_ls",
				}, -- add more as needed
				automatic_installation = true,
			})
		end,
	},

	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = 'default',
				['<C-n>'] = {
					function(cmp)
						cmp.show()
					end,
					"select_next",
				}
			},
			appearance = {
				nerd_font_variant = 'mono',
			},
			completion = {
				documentation = {
					auto_show = true,
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					}
				},
				menu = {
					auto_show = false,
				},
				ghost_text = {
					enabled = false,
				},
			},
			sources = {
				default = {
					'lsp',
					'snippets',
					'path',
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
			signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			},
		},
		opts_extend = {
			"sources.default",
		}
	}
}
