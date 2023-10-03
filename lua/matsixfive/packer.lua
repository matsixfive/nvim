-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require('packer').startup(
function(use)
	use { 'wbthomason/packer.nvim', run = ':PackerSync' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- *********** LSP ************
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	}

	-- *********** Misc ***********
	use 'echasnovski/mini.nvim'
	use 'stevearc/oil.nvim'
	use 'mbbill/undotree'


	-- ********* Editing **********
	use { 'github/copilot.vim', branch = 'release' }
	use 'nishigori/increment-activator'
	use 'rstacruz/vim-closer'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	}
	use 'echasnovski/mini.nvim'

	use 'folke/tokyonight.nvim'

	use 'lewis6991/gitsigns.nvim'

	use 'stevearc/oil.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'mbbill/undotree'

	use { 'github/copilot.vim', branch = 'release' }

	use 'xiyaowong/transparent.nvim'

	-- use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

	use 'nishigori/increment-activator'

	use 'nvim-telescope/telescope-ui-select.nvim'

	use 'rstacruz/vim-closer'

	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use 'nvim-tree/nvim-web-devicons'

	-- ************ UI ************
	use 'lewis6991/gitsigns.nvim'
	use 'xiyaowong/transparent.nvim'
	use { 'nvim-tree/nvim-web-devicons',
		config = function()
			require('gitsigns').setup()
		end,
	}

	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'folke/tokyonight.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
