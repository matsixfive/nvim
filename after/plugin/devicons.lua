-- require('nvim-web-devicons').setup {
-- 	color_icons = true,
-- 	-- default = true,
-- 	-- strict = true,
-- 	-- override = {
-- 	-- 	txt = {
-- 	-- 		icon = ''
-- 	-- 	},
-- 	-- 	html = {
-- 	-- 		icon = "",
-- 	-- 		color="#dd4b25",
-- 	-- 		name="Html"
-- 	-- 	}
-- 	-- },
-- 	override = {
-- 		html = { icon = "", color = "#DE8C92", name = "html" },
-- 		-- Other file type overrides...
-- 	},
-- 	override_by_filename = {
-- 		["Pipfile"] = {
-- 			icon = ""
-- 		}
-- 	},
-- 	override_by_extension = {
-- 		["oil"] = {
-- 			icon = ""
-- 		},
-- 	}
-- }
require('nvim-web-devicons').setup {
  override = {
    html = { icon = "", color = "#dd4b25", name = "html" },
		txt = { icon = "", color = "#DE8C92", name = "txt" },
  },
	override_by_extension = {
		["oil"] = {
			icon = "",
			color = "#ffffff",
			name = "Oil"
		},
		["svelte"] = { icon = "", color="#ff0000", name = "Svelte"}
	},
	override_by_filename = {
		["oil"] = {
			icon = "",
			color = "#ffffff",
			name = "Oil"
		},
	},
}

require('nvim-web-devicons').set_default_icon('', '#a9b1d6', 153)

-- S         󰒯   
