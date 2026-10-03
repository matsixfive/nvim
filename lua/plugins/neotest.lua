vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,
	{ desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run(vim.fn.expand("%")) end,
	{ desc = "Run all tests in current file" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })

-- `:Neotest attach` when opening a java file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("neotest").run.attach()

		local dap = require("dap")

		local mason = vim.fn.stdpath("data") .. "/mason/packages"

		dap.adapters.java = {
			type = "server",
			host = "127.0.0.1",
			port = 0,
			executable = {
				command = "java",
				args = {
					"-jar",
					mason .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar",
				},
			},
		}


		dap.configurations.java = {
			{
				type = "java",
				request = "launch",
				name = "Debug Java",
				mainClass = function()
					return vim.fn.input("Main class: ")
				end,
			},
		}
	end,
})

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
