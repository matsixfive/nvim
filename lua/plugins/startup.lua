return {
	{
		'startup-nvim/startup.nvim',
		opts = {
			header = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Header",
				margin = 5,
				content = {
					"",
					" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
					" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
					" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
					" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
					" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
					" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
					"",
				},
				highlight = "Statement",
				default_color = "",
				oldfiles_amount = 0,
			},
			body = {
				type = "mapping",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Basic Commands",
				margin = 5,
				content = {
					{ " Open Current Directory", "Oil", "o" },
					{ " Find File", "Telescope find_files", "f" },
					{ " Colorschemes", "Telescope colorscheme", "c" },
				},
				highlight = "String",
				default_color = "",
				oldfiles_amount = 0,
			},
			parts = { "header", "body" },
		}
	}
}
