return {
	"danymat/neogen",
	version = "*",
	lazy = true,
	keys = {
		{ "<leader>dc", function() require("neogen").generate() end, desc = "Generate documentation" },
	},
	opts = {},
}
