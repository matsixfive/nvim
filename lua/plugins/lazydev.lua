return {
	"folke/lazydev.nvim",
	ft = "lua",   -- only load on lua files
	opts = {
		library = {
			{ path = "~/.config/nvim/lua", words = { "require" } },
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
