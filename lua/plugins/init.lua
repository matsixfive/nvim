return {
	-- ********* Editing **********
	"rstacruz/vim-closer",

	-- *********** Misc ***********
	{
		"eandrju/cellular-automaton.nvim",
		lazy = true,
		cmd = "CellularAutomaton",
	},

	{
		"matsixfive/lspui.nvim",
		dev = true,
		---@type lspui.Opts
		opts = {
			ui_select = {
				enable = true,
				keymap = {
					select = "<CR>",
					close = { "<ESC>", "q", "<C-c>" }
				}
			}
		},
	}
}
