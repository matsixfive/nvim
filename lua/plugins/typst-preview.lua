vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		vim.keymap.set("n", "<leader>tp", function ()
			require("typst-preview")
			vim.cmd("TypstPreviewToggle")
		end, { desc = "Typst Preview", buffer = true })
	end,
})

return {
	"chomosuke/typst-preview.nvim",
	lazy = true,
	version = "1.*",
	ft = { "typst" },
	commands = { "TypstPreviewToggle", "TypstPreviewStart", "TypstPreviewStop" },
	opts = {
		debug = true,
		dependencies_bin = {
			dependencies_bin = {
				['tinymist'] = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/tinymist',
			}
		}
	},
}
