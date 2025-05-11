vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()

		local lsp = require('lsp-zero').preset({})

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)

			vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
			vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
			vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
		end)

		local cmp = require('cmp')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
			['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
			['<C-y>'] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		cmp_mappings['<Tab>'] = nil
		cmp_mappings['<S-Tab>'] = nil

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
		})

		vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.open_float() end)

		lsp.setup()

  end
})
