return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	opts = {
		default = true,
		default_icon = {
			icon = "",
			color = "#a9b1d6",
			name = "Default"
		},
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
}
