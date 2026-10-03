vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,
	{ desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run(vim.fn.expand("%")) end,
	{ desc = "Run all tests in current file" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })

return {
	{
		"rcasia/neotest-java",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-dap",        -- for debugging (optional)
			"rcarriga/nvim-dap-ui",         -- recommended
			"theHamsta/nvim-dap-virtual-text", -- recommended
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-java")({
						-- Optional configuration here
					}),
				},
			})
		end,
	},
}
