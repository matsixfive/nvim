require('nvim-web-devicons').setup {
  override = {
    html = { icon = "", color = "#dd4b25", name = "html" },
		txt = { icon = "", color = "#DE8C92", name = "txt" },
		toml = { icon = "", color = "#e6b943", name = "toml" },
		svg = { icon = "", color = "#FFB13B", name = "svg" },
		pdf = { icon = "", color = "#BD2C40", name = "pdf" },
		oil = { icon = "", color = "#ffffff", name = "oil" },
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
--     
--     󰬄   󰬞   󰰮  󰰭  󰰯  

local all_icons = require('nvim-web-devicons').get_icons()

function PrintAllIcons()
	for k, v in pairs(all_icons) do
		print(k, v.icon, v.color, v.name)
	end
end
