require('lualine').setup {
	sections = {
		lualine_b = {'branch', 'diff'},
		lualine_y = {{
			'datetime',
			style = 'iso'
		}}
	},
}
