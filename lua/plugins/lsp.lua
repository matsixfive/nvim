return {
	{
		'VonHeikemen/lsp-zero.nvim',
		lazy = true,
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig', -- Required
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			'williamboman/mason-lspconfig.nvim', -- Optional

			-- Autocompletion
			'hrsh7th/nvim-cmp',  -- Required
			'hrsh7th/cmp-nvim-lsp', -- Required
			'L3MON4D3/LuaSnip',  -- Required
		}
	},
	{
		'mfussenegger/nvim-jdtls',
		lazy = true,
	},
	{
		'saadparwaiz1/cmp_luasnip',
		lazy = true,
		dependencies = {
			'L3MON4D3/LuaSnip'
		}
	},
}
