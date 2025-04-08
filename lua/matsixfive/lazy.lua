-- auto update
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require('lazy').setup({
	-- *********** Misc ***********
	'echasnovski/mini.nvim',
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
	-- { 'github/copilot.vim',              branch = 'release' },
	{ 'zbirenbaum/copilot.lua',   event = 'InsertEnter' },
	{ 'AndreM222/copilot-lualine' },

	-- ************ UI ************
	'nvim-telescope/telescope.nvim',
	{
		'matsixfive/chafa.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'm00qek/baleia.nvim'
		}
	},
	'stevearc/oil.nvim',
	{ 'refractalize/oil-git-status.nvim', dependencies = { 'stevearc/oil.nvim', }, },
	-- 'rktjmp/lush.nvim',
	'folke/tokyonight.nvim',
	'startup-nvim/startup.nvim',
	'navarasu/onedark.nvim',
	'nvim-tree/nvim-web-devicons',
	'nvim-telescope/telescope-ui-select.nvim',
	{ 'lewis6991/gitsigns.nvim',          config = true },
	'f-person/git-blame.nvim',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
	},
	'lukas-reineke/indent-blankline.nvim'
})
