require('nvim-web-devicons').setup {
	color_icons = true,
	default = true,
	strict = true,
	overrides = {
		txt = {
			icon = ''
		},
	},
	override_by_filename = {
		["Pipfile"] = {
			icon = ""
		}
	},
	override_by_extension = {
		["oil"] = {
			icon = ""
		}
	}
}

require('nvim-web-devicons').set_default_icon('', '#a9b1d6', 153)
