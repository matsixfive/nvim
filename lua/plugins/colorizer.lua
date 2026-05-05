return {
	"norcalli/nvim-colorizer.lua",
	ft = {
		"html",
		"css",
		"scss",
		"typst"
	},
	opts = {
		css = { rgb_fn = true, }, -- Enable `rgb()` functions in CSS
		html = { names = true, }, -- Enable color names like "red"
	}
}
