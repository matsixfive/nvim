local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>',
	function()
		local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
		if ret == 0 then
			builtin.git_files()
		else
			builtin.find_files()
		end
	end, {}
)

require('telescope').load_extension('media_files')
require('telescope').load_extension('ui-select')

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
