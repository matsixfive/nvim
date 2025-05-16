return {
	-- *********** Misc ***********
	'nvim-lua/plenary.nvim',
	'mbbill/undotree',

	-- ********* Editing **********
	'rstacruz/vim-closer',

	-- ************ UI ************
	'nvim-tree/nvim-web-devicons',
	{ 'lewis6991/gitsigns.nvim', opts = {} },

	{
		'eandrju/cellular-automaton.nvim' ,
		lazy = true,
		cmd = 'CellularAutomaton',
	}
}
