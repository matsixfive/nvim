require("matsixfive.remap")
-- require("matsixfive.lazynvim")
require("matsixfive.set")

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

vim.g.mapleader = " "

require('lazy').setup({
	-- *********** Misc ***********
	'echasnovski/mini.nvim',
	'nvim-lua/plenary.nvim',
	'mbbill/undotree',
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- ********* Editing **********
	{ 'github/copilot.vim', branch = 'release' },
	{ 'numToStr/Comment.nvim', config = true },
	'nishigori/increment-activator',
	'rstacruz/vim-closer',

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
			'hrsh7th/nvim-cmp', -- Required
			'hrsh7th/cmp-nvim-lsp', -- Required
			'L3MON4D3/LuaSnip', -- Required
		}
	},

	-- ************ UI ************
	'nvim-telescope/telescope.nvim',
	'stevearc/oil.nvim',
	'folke/tokyonight.nvim',
	'nvim-tree/nvim-web-devicons',
	'nvim-telescope/telescope-ui-select.nvim',
	{	'lewis6991/gitsigns.nvim', config = true },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
	},
})
