return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			{
				'AndreM222/copilot-lualine',
				lazy = true,
			},
			'arkav/lualine-lsp-progress'
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
						symbols = {
							error = " ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					}
				},
				lualine_c = {
					'filename',
				},
				lualine_x = {
					{
						'lsp_progress',
						display_components = {
							'lsp_client_name',
							'spinner',
							'percentage',
							'title'
						},
						separators = {
							lsp_client_name = { pre = '', post = '' },
						},
						spinner_symbols = {
							'🌑 ',
							'🌒 ',
							'🌒 ',
							'🌓 ',
							'🌔 ',
							'🌔 ',

							'🌕 ',
							'🌖 ',
							'🌖 ',
							'🌗 ',
							'🌘 ',
							'🌘 ',
						},
						timer = {
							spinner = 100,
						}
					},
					{
						'copilot',
						symbols = {
							status = {
								icons = {
									enabled = " ",
									sleep = " ",
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
