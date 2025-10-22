return {
	'nishigori/increment-activator',
	keys = {
		"<C-a>",
		"<C-x>",
	},
	config = function()
		vim.g.increment_activator_filetype_candidates = {
			["_"] = {
				{ "up",    "down" },
				{ "left",  "right" },
				{ "first", "last" },
			},
			["css"] = {
				{ "inside",        "outside" },
				{ "ltr",           "rtl" },
				{ "min-content",   "max-content" },
				{ "nowrap",        "wrap",         "wrap-reverse" },
				{ "show",          "hide" },
				{ "static",        "relative",     "absolute",    "fixed", "sticky" },
				{ "underline",     "overline",     "line-through" },
				{ "row",           "column" },
				{ "dark",          "light" },
				{ "inline",        "inline-block" },
				{ "block",         "inline-block" },
				{ "space-between", "space-around", "space-evenly" },
				{ "visible",       "hidden" },
			}
		}
	end,
}
