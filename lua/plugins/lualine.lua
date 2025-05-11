return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			{
				'AndreM222/copilot-lualine',
				lazy = true,
			},
		},
		opts = {
			sections = {
				lualine_a = { 'mode' },
				lualine_b = {
					'branch',
					'diff',
					{
						'diagnostics',
						sources = { 'nvim_lsp' },
						symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
					}
				},
				lualine_c = {
					'filename',
				},
				lualine_x = {
					{
						'copilot',
						symbols = {
							status = {
								icons = {
									enabled = " ",
									sleep = " ", -- auto-trigger disabled
									disabled = " ",
									warning = " ",
									unknown = " "
								},
								hl = {
									enabled = "#00AF5F",
									sleep = "#AEB7D0",
									disabled = "#6272A4",
									warning = "#FFB86C",
									unknown = "#FF5555"
								}
							},
						},
						show_colors = true,
						show_loading = true,
					},
					'encoding',
					'fileformat',
				},
				lualine_y = { 'filetype' },
				lualine_z = { 'location' }
			},
		},
	},
}
