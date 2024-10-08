local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Telescope vim help" })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>cs',
	function()
		builtin.colorscheme({ enable_preview = true })
	end, { desc = "Telescope colorscheme" }
)
vim.keymap.set('n', '<C-p>',
	function()
		local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
		if ret == 0 then
			builtin.git_files()
		else
			builtin.find_files()
		end
	end, { desc = "Telescope git files" }
)

-- vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})

-- change mappings
require('telescope').setup({
	defaults = {
		danamic_preview_title = true,
		mappings = {
			i = {
				["<C-j>"] = require('telescope.actions').move_selection_next,
				["<C-k>"] = require('telescope.actions').move_selection_previous,
			}
		},
	},
})
