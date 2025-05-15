return {
	'nishigori/increment-activator',
	config = function()
		vim.g.increment_activator_filetype_candidates = {
			["css"] = {
				{ "inside", "outside" },
				{ "ltr", "rtl" },
				{ "min-content", "max-content" },
				{ "nowrap", "wrap", "wrap-reverse" },
				{ "show", "hide" },
				{ "static", "relative", "absolute", "fixed", "sticky" },
				{ "underline", "overline", "line-through" },
				{ "row", "column" },
				{ "dark", "light" },
				{ "inline", "inline-block" },
				{ "block", "inline-block" },
				{ "space-between", "space-around", "space-evenly" },
				{ "visible", "hidden" },
			}
		}
	end,
}
