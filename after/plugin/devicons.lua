require('nvim-web-devicons').setup {
  override = {
    html = { icon = "", color = "#dd4b25", name = "html" },
		txt = { icon = "", color = "#DE8C92", name = "txt" },
		toml = { icon = "", color = "#e6b943", name = "toml" },
  },
	override_by_extension = {
		["oil"] = {
			icon = "",
			color = "#ffffff",
			name = "Oil"
		},
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

--    
--   
