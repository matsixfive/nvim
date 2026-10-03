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

-- The `java-debug-adapter` mason package ships an OSGi *bundle*, not a runnable jar,
-- so it cannot be spawned with `java -jar`. jdtls has to load it instead, which it
-- does for every jar listed in `init_options.bundles`. Glob the version so mason
-- upgrades don't break this.
local java_debug_bundle = vim.fn.glob(
	vim.fn.stdpath("data")
		.. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
	false,
	true
)[1]

if java_debug_bundle then
	vim.lsp.config("jdtls", { init_options = { bundles = { java_debug_bundle } } })
else
	vim.schedule(function()
		vim.notify("java-debug-adapter not found, Java debugging disabled", vim.log.levels.WARN)
	end)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		-- Registers `dap.adapters.java`. The `java-debug-adapter` mason package ships an
		-- OSGi *bundle* with no `Main-Class`, so `java -jar` on it always exits 1. The only
		-- supported way to run it is inside jdtls, which is asked to start a debug server
		-- via `vscode.java.startDebugSession` and hands back the port to connect to.
		-- This needs the `init_options.bundles` set above, otherwise jdtls never
		-- advertises that command.
		local dap = require("dap")
		dap.adapters.java = function(callback)
			local client = vim.lsp
				.get_clients({ bufnr = 0, name = "jdtls" })[1]
				or vim.lsp.get_clients({ name = "jdtls" })[1]

			if not client then
				vim.notify("java: no running jdtls to start a debug session", vim.log.levels.ERROR)
				return
			end

			client:request("workspace/executeCommand", {
				command = "vscode.java.startDebugSession",
			}, function(err, port)
				if err or not port then
					vim.notify(
						"java: vscode.java.startDebugSession failed (is java-debug-adapter installed?)",
						vim.log.levels.ERROR
					)
					return
				end

				callback({ type = "server", host = "127.0.0.1", port = port })
			end)
		end
	end,
})

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
