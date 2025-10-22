return {
	'Saghen/blink.cmp',
	dependencies = {
		-- 'rafamadriz/friendly-snippets',
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			-- install jsregexp (optional!).
			-- build = "make install_jsregexp"
			lazy = true,
			config = function()
				require("luasnip.loaders.from_snipmate").lazy_load()
			end,
		}
	},
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
				'lsp',
				'snippets',
				'path',
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
