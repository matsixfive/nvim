vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format({ async = true }) end)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "jdtls" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})


return {
	{
		"neovim/nvim-lspconfig",
		event = { "VeryLazy" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				lazy = true,
				opts = {
					ensure_installed = {
						-- NVIM
						"lua_ls",

						-- WEB
						"cssls",
						-- "tailwindcss",
						"emmet_language_server",
						"ts_ls",

						-- UNI
						"jdtls",
						"tinymist",

						-- OTHER
						"rust_analyzer",
					},
					automatic_installation = true,
				},
				dependencies = {
					"williamboman/mason.nvim",
					lazy = true,
					build = ":MasonUpdate",
					opts = true,
				},
			},
		},
	},

	{
		'Saghen/blink.cmp',
		-- dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',

		lazy = true,
		event = "InsertEnter",

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
					auto_show = true,
				},
				ghost_text = {
					enabled = false,
				},
			},
			sources = {
				default = {
					'lazydev',
					'lsp',
					'snippets',
					'path',
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			snippets = { preset = 'luasnip' },
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
