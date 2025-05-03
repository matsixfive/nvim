return {
	-- *********** Misc ***********
	'nvim-lua/plenary.nvim',
	'mbbill/undotree',
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- ********* Editing **********
	'numToStr/Comment.nvim',
	'nishigori/increment-activator',
	'rstacruz/vim-closer',
	{ 'danymat/neogen',                  version = '*' },

	-- ********** LSP *************
	{
		'VonHeikemen/lsp-zero.nvim',
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
	'mfussenegger/nvim-jdtls',
	{
		'saadparwaiz1/cmp_luasnip',
		dependencies = {
			'L3MON4D3/LuaSnip'
		}
	},

	-- ********** Copilot *********
	{ 'zbirenbaum/copilot.lua',   event = 'InsertEnter' },
	{ 'AndreM222/copilot-lualine' },

	-- ************ UI ************
	'nvim-telescope/telescope.nvim',
	'nvim-tree/nvim-web-devicons',
	'nvim-telescope/telescope-ui-select.nvim',
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	'lukas-reineke/indent-blankline.nvim',
	'folke/tokyonight.nvim'
}
