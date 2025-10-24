vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format({ async = true }) end)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "jdtls" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})


return {
	{
		"neovim/nvim-lspconfig",
		event = { "VeryLazy" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				lazy = true,
				opts = {
					automatic_installation = true,
					ensure_installed = {
						-- NVIM
						"lua_ls",

						-- WEB
						"cssls",
						-- "tailwindcss",
						"emmet_language_server",
						"ts_ls",

						-- UNI
						"jdtls",
						"tinymist",

						-- OTHER
						"rust_analyzer",
						"hls",
					},
				},
				dependencies = {
					"williamboman/mason.nvim",
					lazy = true,
					build = ":MasonUpdate",
					opts = true,
				},
			},
		},
	},
}
