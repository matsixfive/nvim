vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format({ async = true }) end)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuOpen',
  callback = function()

    require("copilot.suggestion").dismiss()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuClose',
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

-- lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"williamboman/mason-lspconfig.nvim",
			"Saghen/blink.cmp",
			-- "L3MON4D3/LuaSnip",
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
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono',
			},
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			sources = {
				default = {
					'lsp',
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
