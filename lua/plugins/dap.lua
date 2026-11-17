vim.keymap.set("n", "<leader>bp", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

-- while debugging, use the following keybindings to control the debugger:
-- Down: Step over
-- Right: Step into
-- Left: Step out
-- Up: Restart frame
vim.keymap.set("n", "<Down>", function()
	require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<Right>", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<Left>", function()
	require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<Up>", function()
	require("dap").continue()
end, { desc = "Continue" })

-- make breakpoints look like red dots
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("dapui").setup()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
}
