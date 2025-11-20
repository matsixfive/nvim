return {
	"norcalli/nvim-colorizer.lua",
	opts = {
		["*"] = { mode = "background" },

		css = { rgb_fn = true, }, -- Enable `rgb()` functions in CSS
		html = { names = true, }, -- Enable color names like "red"
	}
}
