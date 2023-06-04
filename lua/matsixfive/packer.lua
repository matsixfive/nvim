-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use {'wbthomason/packer.nvim', run = ':PackerSync'}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

	use 'echasnovski/mini.nvim'

	-- use 'folke/tokyonight.nvim'
	use {
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end
	}

	use 'stevearc/oil.nvim'

	use	 {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use 'mbbill/undotree'

	use 'xiyaowong/transparent.nvim'

	use 'github/copilot.vim'

	use 'mhartington/formatter.nvim'

	use 'nvim-tree/nvim-web-devicons'
	-- use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

	use 'nishigori/increment-activator'

	use 'rstacruz/vim-closer'

	use 'nvim-tree/nvim-web-devicons'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

end)
